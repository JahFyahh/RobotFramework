# Define the string containing URLs
$string = Get-Content -Path "C:\pCloud\Holding\Nayrobiz\Boekhouden\1kapper\klanten\kapper_data.csv"  # This can also be loaded from a file using Get-Content

# Define the regular expression pattern
$pattern = 'https://employee\.1kapper\.nl/customers/(\d+)/edit'

# Find all matches using Select-String
$matches = $string | Select-String -Pattern $pattern -AllMatches | ForEach-Object { $_.Matches.Groups[1].Value }

# Output the matches
$ids = @()
$matches | Select-Object -Unique | ForEach-Object {$ids += "https://employee.1kapper.nl/customers/$($_)/gdpr-downloads"}
    
$ids | Set-Content -Path "C:\pCloud\Holding\Nayrobiz\Boekhouden\1kapper\klanten\id_links.txt"



