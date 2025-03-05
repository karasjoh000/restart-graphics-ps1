# setup
```powershell
notepad $PROFILE
```
enter the following: 
```powershell
function rg {
	param(
		[switch]$Help
	)
	& "$env:USERPROFILE\path\to\repo\restart-graphics-ps1\rg.ps1"
}
```
open new powershell as administrator and run `rg` to refresh

