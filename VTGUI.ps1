# EDIT THE BELOW LINE WITH YOUR API KEY
Set-Variable -Name "apiKey" -value 'YOUR API KEY HERE' -Scope Global
###
Add-Type -AssemblyName PresentationFramework
[xml]$xaml = @"
<Window xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation" Width="1300" Height="500" Title="VTGUI">
    <Grid Margin="0,3,2,0">
        <Label Name="lblIOC" HorizontalAlignment="Left" VerticalAlignment="Top" Content="IOCs:" Margin="30,10,0,0" Width="51" Height="35" FontSize="15" FontWeight="Heavy"/>
        <Label Name="lblOutput" HorizontalAlignment="Left" VerticalAlignment="Top" Content="Output:" Margin="10,53,0,0" Width="70" Height="35" FontSize="15" FontWeight="Heavy"/>
        <RadioButton Name="radHash" HorizontalAlignment="Left" VerticalAlignment="Top" Content="Hash" Margin="600,10,0,0" GroupName="runType" FontWeight="Black"/>
        <RadioButton Name="radURL" HorizontalAlignment="Left" VerticalAlignment="Top" Content="URL" Margin="600,25,0,0" GroupName="runType" FontWeight="Black"/>
        <Button Name="btnExecute" Content="Execute" HorizontalAlignment="Left" VerticalAlignment="Top" Width="92" Margin="650,10,0,0"  Height="30" Background="#ffb3b3" FontWeight="Black" FontSize="14" BorderThickness="2,2,2,2" BorderBrush="#000000"/>
        <Button Name="btnExport" Content="Export" HorizontalAlignment="Left" VerticalAlignment="Top" Width="92" Margin="580,53,0,0" BorderThickness="2,2,2,2" BorderBrush="#000000" Background="#4a90e2" Height="30" FontSize="14" FontWeight="Black" />
        <Rectangle HorizontalAlignment="Left" VerticalAlignment="Top" Fill="#FFF4F4F5" Stroke="Black" Height="75" Width="215" Margin="860,10,0,0" Opacity="0.2"/>
        <RadioButton Name="radAll" HorizontalAlignment="Left" VerticalAlignment="Top" Content="All" Margin="880,18,0,0" GroupName="Copy" FontWeight="Black"/>
        <RadioButton Name="radMal" HorizontalAlignment="Left" VerticalAlignment="Top" Content="Malicious" Margin="880,33,0,0" GroupName="Copy" FontWeight="Black"/>
        <RadioButton Name="radCell" HorizontalAlignment="Left" VerticalAlignment="Top" Content="Cell" Margin="880,48,0,0" GroupName="Copy" FontWeight="Black"/>
        <RadioButton Name="radNoScan" HorizontalAlignment="Left" VerticalAlignment="Top" Content="No Scan" Margin="880,63,0,0" GroupName="Copy" FontWeight="Black"/>
        <Button Name="btnCopymalMD5" Content="Copy" HorizontalAlignment="Left" VerticalAlignment="Top" Width="92" Margin="970,18,0,0"  Height="30" Background="#4a90e2" FontWeight="Black" FontSize="14" BorderThickness="2,2,2,2" BorderBrush="#000000"/>
        <TextBox Name="txtInput" HorizontalAlignment="Left" VerticalAlignment="Top" Height="30" Width="520" AcceptsReturn="True" TextWrapping="Wrap" VerticalScrollBarVisibility="Visible" FontSize="14" Margin="75,10,0,0"/>
        <TextBox Name="txtOutput" HorizontalAlignment="Left" VerticalAlignment="Top" Height="30" Width="500" AcceptsReturn="True" TextWrapping="Wrap" HorizontalScrollBarVisibility="Visible" FontSize="14" Margin="75,53,0,0"/>
        <TextBox Name="txtAPIKey" HorizontalAlignment="Left" VerticalAlignment="Top" Height="15" Width="350" AcceptsReturn="True" TextWrapping="Wrap" Visibility="Hidden" HorizontalScrollBarVisibility="Visible" FontSize="10" Margin="930,435,0,0"/>
        <CheckBox Name="chkAPIKey" HorizontalAlignment="Left" VerticalAlignment="Top" Content="API Key" Margin="860,435,0,0"/>
        <CheckBox Name="chkDarkMode" HorizontalAlignment="Left" VerticalAlignment="Top" Content="Dark Mode" Margin="770,435,0,0"/>
        <DataGrid HorizontalAlignment="Left" AutoGenerateColumns="True" VerticalAlignment="Top" Width="1275" Height="180" Margin="5,90,0,0" IsManipulationEnabled="True" Name="dgdAlert" Visibility="Hidden" FontWeight="Heavy" >
        <DataGrid.RowStyle>
            <Style TargetType="DataGridRow">     
                <Style.Triggers>
                    <DataTrigger Binding="{Binding Alert}" Value="0">
                        <Setter Property="Background" Value="#b3ffb3"></Setter>
                    </DataTrigger>
                    <DataTrigger Binding="{Binding Alert}" Value="1">
                        <Setter Property="Background" Value="#ffd1b3"></Setter>
                    </DataTrigger>
                    <DataTrigger Binding="{Binding Alert}" Value="2">
                        <Setter Property="Background" Value="#ffb3b3"></Setter>
                    </DataTrigger>
                </Style.Triggers>
            </Style>
        </DataGrid.RowStyle>
            <DataGrid.Columns>
                <DataGridTextColumn Header="MD5" Binding="{Binding MD5}" Width="232" />
                <DataGridTextColumn Header="SHA256" Binding="{Binding SHA256}" Width="455"/>
                <DataGridTextColumn Header="AnalysisDate" Binding="{Binding AnalysisDate}" Width="87"/>
                <DataGridTextColumn Header="FileName" Binding="{Binding FileName}" Width="310"/>
                <DataGridTextColumn Header="Sign" Binding="{Binding Signed}" Width="35"/>
                <DataGridTextColumn Header="Mal" Binding="{Binding Malicious}" Width="35"/>
                <DataGridTextColumn Header="Sus" Binding="{Binding Suspicious}" Width="35"/>
                <DataGridTextColumn Header="Rep" Binding="{Binding Reputation}" Width="35"/>
                <DataGridTextColumn Header="MalV" Binding="{Binding MalV}" Width="40"/>
                <DataGridTextColumn Header="Alert" Binding="{Binding Alert}" Visibility="Collapsed" Width="0"/>
            </DataGrid.Columns>
        </DataGrid>
        <DataGrid HorizontalAlignment="Left" AutoGenerateColumns="True" VerticalAlignment="Top" Width="1275" Height="180" Margin="5,90,0,0" IsManipulationEnabled="True" Name="dgdURL" Visibility="Hidden" FontWeight="Heavy">
        <DataGrid.RowStyle>
            <Style TargetType="DataGridRow">     
                <Style.Triggers>
                    <DataTrigger Binding="{Binding Alert}" Value="0">
                        <Setter Property="Background" Value="#b3ffb3"></Setter>
                    </DataTrigger>
                    <DataTrigger Binding="{Binding Alert}" Value="1">
                        <Setter Property="Background" Value="#ffd1b3"></Setter>
                    </DataTrigger>
                    <DataTrigger Binding="{Binding Alert}" Value="2">
                        <Setter Property="Background" Value="#ffb3b3"></Setter>
                    </DataTrigger>
                </Style.Triggers>
            </Style>
        </DataGrid.RowStyle>   
            <DataGrid.Columns>
                <DataGridTextColumn Header="URL" Binding="{Binding URL}" Width="420" />
                <DataGridTextColumn Header="LastFinalURL" Binding="{Binding LastFinalURL}" Width="615"/>
                <DataGridTextColumn Header="AnalysisDate" Binding="{Binding AnalysisDate}" Width="90"/>
                <DataGridTextColumn Header="Mal" Binding="{Binding Malicious}" Width="35"/>
                <DataGridTextColumn Header="Sus" Binding="{Binding Suspicious}" Width="35"/>
                <DataGridTextColumn Header="Rep" Binding="{Binding Reputation}" Width="35"/>
                <DataGridTextColumn Header="MalV" Binding="{Binding MalV}" Width="40"/>
                <DataGridTextColumn Header="Alert" Binding="{Binding Alert}" Visibility="Collapsed" Width="0"/>
            </DataGrid.Columns>
        </DataGrid>
        <DataGrid HorizontalAlignment="Left" VerticalAlignment="Top" Width="1275" Height="145" Margin="5,282,0,0" FontWeight="Heavy" Name="dgdNotFound">
            <DataGrid.Columns>
                <DataGridTextColumn Header="NoScan" Binding="{Binding NoScan}" Width="1265"/>
            </DataGrid.Columns>
        </DataGrid>
    </Grid>
</Window>
"@

$reader = (New-Object System.Xml.XmlNodeReader $xaml)
$xmlwindow = [Windows.Markup.XamlReader]::Load($reader)
$xaml.SelectNodes("//*[@*[contains(translate(name(.),'n','N'),'Name')]]") | ForEach {
    New-Variable  -Name $_.Name -Value $xmlwindow.FindName($_.Name) -Force;
}

$txtInput.Add_TextChanged({
    $ioclist = $txtInput.Text -split '\r?\n'  #Split input on Newline
    Set-Variable -Name "ioclist" -value $ioclist -Scope Global #create global hash input variable
})

$btnCopymalMD5.Add_Click({
    if ($radAll.IsChecked) { if ($radHash.IsChecked) {$results.MD5 | Set-Clipboard} elseif ($radURL.IsChecked) {$results.Url | Set-Clipboard}}
    if ($radMal.IsChecked) { if ($radHash.IsChecked) {$results | where {$_.Malicious -gt 0 -OR $_.Suspicious -gt 0} | Select -expandproperty MD5 | Set-Clipboard} elseif ($radURL.IsChecked) {$results | where {$_.Malicious -gt 0 -OR $_.Suspicious -gt 0} | Select -expandproperty Url | Set-Clipboard }}
    if ($radCell.IsChecked) {if ($radHash.IsChecked) {$dgdAlert.SelectedItem.MD5 | Set-Clipboard} elseif ($radURL.IsChecked) {$dgdURL.SelectedItem.Url | Set-Clipboard}}
    if ($radNoScan.IsChecked) {$noscanlist.Hash | Set-Clipboard }
})

$btnExport.Add_Click({
    if (Test-Path $txtOutput.Text) {$path = $txtOutput.Text} else {$path = '.\output_ioc.csv'}
    if ($radHash.IsChecked) {$results | select-object MD5, Sha256, Name, MalVotes, Harmless, Malicious, Suspicious, AnalysisDate, Reputation, Symantec_Cat, Symantec_EngVer, Symantec_Method, Symantec_Result | export-csv -path $path -NoTypeInformation} 
    if ($radURL.IsChecked) {$results | select-object Url, MalVotes, Reputation, Harmless, Malicious, Suspicious, AnalysisDate, LastFinalUrl | export-csv -path $path -NoTypeInformation}
})

$chkAPIKey.Add_Click({
    if ($this.IsChecked) { $txtAPIKey.Visibility="Visible"; $txtAPIKey.Text=$apiKey} else { $txtAPIKey.Visibility="Hidden"}
})

$radHash.Add_Click({
    $dgdURL.Visibility="Hidden"
    $dgdAlert.Visibility="Visible"
})

$radURL.Add_Click({
    $dgdAlert.Visibility="Hidden"
    $dgdURL.Visibility="Visible"
})

$chkDarkMode.Add_Click({
    if ($this.IsChecked) { 
        $xmlwindow.Background = "#4a4a4a"
        $txtInput.Background = "#4a4a4a"; $txtInput.Foreground = "#FFFFFF"
        $txtOutput.Background = "#4a4a4a"; $txtOutput.Foreground = "#FFFFFF"
        $txtAPIKey.Background = "#4a4a4a"; $txtAPIKey.Foreground = "#FFFFFF"
        $dgdAlert.Background = "#4a4a4a"; #$dgdAlert.Foreground = "#FFFFFF"
        $dgdURL.Background = "#4a4a4a"
        $dgdNotFound.Background = "#4a4a4a"; #$dgdNotFound.Foreground = "#FFFFFF"
        $lblIOC.Foreground = "#FFFFFF"
        $lblOutput.Foreground = "#FFFFFF"
        $radAll.Foreground = "#FFFFFF"
        $radCell.Foreground = "#FFFFFF"
        $radMal.Foreground = "#FFFFFF"
        $radNoScan.Foreground = "#FFFFFF"
        $radURL.Foreground = "#FFFFFF"
        $radHash.Foreground = "#FFFFFF"
        $chkAPIKey.Foreground = "#FFFFFF"
        $chkDarkMode.Foreground = "#FFFFFF"
    }
    if (!($this.IsChecked)) {
        $xmlwindow.Background = "#FFFFFF"
        $txtInput.Background = "#FFFFFF"; $txtInput.Foreground = "#000000"
        $txtOutput.Background = "#FFFFFF"; $txtOutput.Foreground = "#000000"
        $txtAPIKey.Background = "#FFFFFF"; $txtAPIKey.Foreground = "#000000"
        $dgdAlert.Background = "#FFFFFF"; #$dgdAlert.Foreground = "#000000"
        $dgdURL.Background = "#FFFFFF"
        $dgdNotFound.Background = "#FFFFFF"; #$dgdNotFound.Foreground = "#000000"
        $lblIOC.Foreground = "#000000"
        $lblOutput.Foreground = "#000000"
        $radAll.Foreground = "#000000"
        $radCell.Foreground = "#000000"
        $radMal.Foreground = "#000000"
        $radNoScan.Foreground = "#000000"
        $radURL.Foreground = "#000000"
        $radHash.Foreground = "#000000"
        $chkAPIKey.Foreground = "#000000"
        $chkDarkMode.Foreground = "#000000"
    }
})

$btnExecute.Add_Click({
    if ($txtInput.Text -match '^.*\.csv$') {if (Test-Path $txtInput.Text) {$ioclist = import-csv $txtInput.Text; $ioclist = $ioclist | select-object -expandproperty ioc} } ## If inputbox ends in CSV, try to load IOCs from path
    $dgdAlert.Items.Clear()
    $dgdURL.Items.Clear()
    $dgdNotFound.Items.Clear()
    $method = "GET"
    $headers = @{ "x-apikey" = "$apiKey" }
    $results = @()
    $noscanlist=@()

    if ($radURL.IsChecked) {
        foreach ($url in $ioclist) {
            try {
            $temp  = [System.Text.Encoding]::UTF8.GetBytes($url)
            $encodedurl=[System.Convert]::ToBase64String($temp)
            $encodedurl=$encodedurl.TrimEnd("=")
            $uri =  "https://www.virustotal.com/api/v3/urls/$encodedurl"
            $scan = Invoke-RestMethod -Method $method -Uri $uri -Headers $headers
            if ($scan.data){
            #$responsecode = $report | select-object -expandproperty response_code
            #if ($responsecode -eq 0) { $noscanlist += $hash; $noscan=$true}
            #else {         
                if ($scan.data.attributes.last_analysis_stats.malicious -gt 0) {$alert="X"} else {$alert=""} 
                $details = @{        
                    Url        = $scan.data.attributes.url
                    MalVotes   = $scan.data.attributes.total_votes.malicious
                    Harmless   = $scan.data.attributes.last_analysis_stats.harmless
                    Malicious  = $scan.data.attributes.last_analysis_stats.malicious
                    Suspicious = $scan.data.attributes.last_analysis_stats.suspicious
                    AnalysisDate=$scan.data.attributes.last_analysis_date
                    LastFinalUrl= $scan.data.attributes.last_final_url
                    Reputation = $scan.data.attributes.reputation
                    Alert      = $alert
                }
                $results += New-Object PSObject -property $details
                $epoch = Get-Date -Date "1970-01-01"; $epoch = $epoch.ToUniversalTime(); $epoch = $epoch.AddSeconds($details.AnalysisDate); $details.AnalysisDate = $epoch.ToString("MM/dd/yyyy"); ## Change analysis date to human readable
                if ($details.Malicious -ge 1) {$Alert=2} elseif ($details.Suspicious -ge 1) {$Alert=2} else {$Alert = 0} ## Assign an Alert Level
                $dgdURL.AddChild([pscustomobject]@{URL=$details.Url;LastFinalUrl=$details.LastFinalUrl;AnalysisDate=$details.AnalysisDate;Malicious=$details.Malicious;Suspicious=$details.Suspicious;Reputation=$details.Reputation;MalV=$details.MalVotes;Alert=$Alert});
            } 
        } catch {$noscanlist += $url; $noscan=$true;}
        }
    }
    elseif ($radHash.IsChecked) {
        foreach ($hash in $ioclist){  
            if($hash) {
                try {
                    $uri =  "https://www.virustotal.com/api/v3/files/$hash"
                    $scan = Invoke-RestMethod -Method $method -Uri $uri  -Headers $headers
                    if ($scan.data){         
                        if ($scan.data.attributes.last_analysis_stats.malicious -gt 0) {$alert="X"} else {$alert=""} 
                            $details = @{        
                            MD5        = $scan.data.attributes.md5
                            Sha256     = $scan.data.id
                            Name       = $scan.data.attributes.meaningful_name
                            MalVotes   = $scan.data.attributes.total_votes.malicious
                            Harmless   = $scan.data.attributes.last_analysis_stats.harmless
                            Malicious  = $scan.data.attributes.last_analysis_stats.malicious
                            Suspicious = $scan.data.attributes.last_analysis_stats.suspicious
                            AnalysisDate=$scan.data.attributes.last_analysis_date
                            Signed     = $scan.data.attributes.signature_info.verified
                            Reputation = $scan.data.attributes.reputation
                            Alert      = $alert
                            }
                        $results += New-Object PSObject -property $details
                        $epoch = Get-Date -Date "1970-01-01"; $epoch = $epoch.ToUniversalTime(); $epoch = $epoch.AddSeconds($details.AnalysisDate); $details.AnalysisDate = $epoch.ToString("MM/dd/yyyy"); ## Change analysis date to human readable
                        if ($details.Malicious -ge 1) {$Alert=2} elseif ($details.Suspicious -ge 1) {$Alert=2} else {$Alert = 0} ## Assign an Alert Level
                        $dgdAlert.AddChild([pscustomobject]@{MD5=$details.MD5;SHA256=$details.SHA256;AnalysisDate=$details.AnalysisDate;FileName=$details.Name;Signed=$details.Signed;Malicious=$details.Malicious;Suspicious=$details.Suspicious;Reputation=$details.Reputation;MalV=$details.MalVotes;Alert=$Alert});
                    }
                } catch {
                    $noscanhash = @{     
                            Hash = $hash
                    }
                    $noscanlist += New-Object PSObject -property $noscanhash
                    $dgdNotFound.AddChild([pscustomobject]@{NoScan=$hash}); 
                }
            }
        }
    }
    Set-Variable -Name "Results" -value $results -Scope Global
    Set-Variable -Name "NoScanList" -value $noscanlist -Scope Global
})
$xmlwindow.ShowDialog() | Out-Null