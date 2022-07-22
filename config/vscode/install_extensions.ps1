# Install VS Code extensions
$Extensions = @(
	# PowerShell
	"ms-vscode.PowerShell",
	
	# SVG Viewer
	"cssho.vscode-svgviewer",
)
foreach ($Extension in $Extensions)
{
	 & "$env:ProgramFiles\Microsoft VS Code\bin\code.cmd" --install-extension $Extension
}
