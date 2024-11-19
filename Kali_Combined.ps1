function prompt {
    # Variables
    $userName = $env:USERNAME
    $computerName = $env:COMPUTERNAME
    $currentPath = $(Get-Location)
    $dateTime = (Get-Date).ToUniversalTime().ToString("yyyy-MM-ddTHH.mm.ss'Z'")

    # Check if admin
    $isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()
    ).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
    $currentVersion = $PSVersionTable.PSVersion.Major

    # Define box-drawing characters using character codes
    $topLeftCorner = [char]0x250C        # ┌
    $horizontalLine = [char]0x2500       # ─
    $doubleHorizontalLine = $horizontalLine + $horizontalLine  # ──
    $bottomLeftCorner = [char]0x2514     # └

    if ($currentVersion -eq 5) {
        if ($isAdmin) {
            $promptSymbol = '#'
            $userName = 'root'
            # Define ANSI escape codes for colors
            $esc = [char]27  # ESC character
            $symbolColor = "${esc}[34m"      # Blue
            $userColor = "${esc}[31m"        # Red
            $specialCharColor = "${esc}[31m" # Red
            $pathColor = "${esc}[37m"        # White
            $resetColor = "${esc}[0m"        # Reset
            $dateColor = "${esc}[93m"        # Yellow
            $powershellStringColor = "${esc}[31m"
            $powershellString = "PS" 

            # First line (printed using Write-Host)
            $firstLine = "$symbolColor$topLeftCorner$doubleHorizontalLine($powershellStringColor$powershellString $dateColor$dateTime $userColor$userName$specialCharColor@$userColor$computerName$symbolColor)-[$pathColor$currentPath$symbolColor]$resetColor"
            Write-Host $firstLine

            # Second line (returned as prompt string)
            $promptString = "$symbolColor$bottomLeftCorner$horizontalLine$promptSymbol $resetColor"

            # Return the prompt string
            return $promptString
        } else {
            $promptSymbol = '$'
            # Define ANSI escape codes for colors
            $esc = [char]27  # ESC character
            $symbolColor = "${esc}[32m"      # Green
            $userColor = "${esc}[34m"        # Blue
            $specialCharColor = "${esc}[34m" # Blue
            $pathColor = "${esc}[37m"        # White
            $resetColor = "${esc}[0m"        # Reset
            $dateColor = "${esc}[93m"        # Yellow
            $powershellStringColor = "${esc}[31m"
            $powershellString = "PS" 

            # First line (printed using Write-Host)
            $firstLine = "$symbolColor$topLeftCorner$doubleHorizontalLine($powershellStringColor$powershellString $dateColor$dateTime $userColor$userName$specialCharColor@$userColor$computerName$symbolColor)-[$pathColor$currentPath$symbolColor]$resetColor"
            Write-Host $firstLine

            # Second line (returned as prompt string)
            $promptString = "$symbolColor$bottomLeftCorner$horizontalLine$promptSymbol $resetColor"

            # Return the prompt string
            return $promptString
        }        
    } elseif ($currentVersion -eq 7) {
        if ($isAdmin) {
            $promptSymbol = '#'
            $userName = 'root'
            # Define ANSI escape codes for colors
            $esc = [char]27  # ESC character
            $symbolColor = "${esc}[34m"      # Blue
            $userColor = "${esc}[31m"        # Red
            $specialCharColor = "${esc}[31m" # Red
            $pathColor = "${esc}[37m"        # White
            $resetColor = "${esc}[0m"        # Reset
            $dateColor = "${esc}[93m"        # Yellow
            $powershellStringColor = "${esc}[34m"
            $powershellString = "pwsh" 

            # First line (printed using Write-Host)
            $firstLine = "$symbolColor$topLeftCorner$doubleHorizontalLine($powershellStringColor$powershellString $dateColor$dateTime $userColor$userName$specialCharColor@$userColor$computerName$symbolColor)-[$pathColor$currentPath$symbolColor]$resetColor"
            Write-Host $firstLine

            # Second line (returned as prompt string)
            $promptString = "$symbolColor$bottomLeftCorner$horizontalLine$promptSymbol $resetColor"

            # Return the prompt string
            return $promptString
        } else {
            $promptSymbol = '$'
            # Define ANSI escape codes for colors
            $esc = [char]27  # ESC character
            $symbolColor = "${esc}[32m"      # Green
            $userColor = "${esc}[34m"        # Blue
            $specialCharColor = "${esc}[34m" # Blue
            $pathColor = "${esc}[37m"        # White
            $resetColor = "${esc}[0m"        # Reset
            $dateColor = "${esc}[93m"        # Yellow
            $powershellStringColor = "${esc}[34m"
            $powershellString = "pwsh" 

            # First line (printed using Write-Host)
            $firstLine = "$symbolColor$topLeftCorner$doubleHorizontalLine($powershellStringColor$powershellString $dateColor$dateTime $userColor$userName$specialCharColor@$userColor$computerName$symbolColor)-[$pathColor$currentPath$symbolColor]$resetColor"
            Write-Host $firstLine

            # Second line (returned as prompt string)
            $promptString = "$symbolColor$bottomLeftCorner$horizontalLine$promptSymbol $resetColor"

            # Return the prompt string
            return $promptString
        }
    } else {
        # Fallback for other PowerShell versions
        $promptSymbol = 'PS'
        return "$promptSymbol $($executionContext.SessionState.Path.CurrentLocation)> "
    }
}
