# setup
*note: using powershell*  

clone repo into some path
```powershell
git clone https://github.com/karasjoh000/restart-graphics-ps1.git "$env:USERPROFILE\path\to\repo\restart-graphics-ps1"
```
edit profile
```powershell
notepad $PROFILE
```
enter the following in opened notepad: 
```powershell
function rg {
	param(
		[switch]$Help
	)
	& "$env:USERPROFILE\path\to\repo\restart-graphics-ps1\rg.ps1"
}
```
open new powershell as administrator and run `rg` to refresh


*credits: deepseek DeepThink (R1)*

