Get-ChildItem -Recurse build/staging -Filter '*.uasset' |
    Group-Object Name |
    Where-Object { $_.Count -gt 1 } |
    ForEach-Object {
        Write-Host "Çoklu kopya: $($_.Name) → $($_.Count) adet"
        foreach ($item in $_.Group) {
            Write-Host "    $($item.FullName)"
        }
    }
