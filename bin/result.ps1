$arg1 = $args[0]
$testlist = [System.Collections.ArrayList]::new()

Select-Xml -Path $arg1 -XPath '/test-results/test-suite/results/test-suite/results/test-suite/results/test-suite/results/test-case' | ForEach-Object {
    $test = @{ 
        name = $_.Node.description
        status = "success"
    }
    if ($_.Node.result -eq "Failure"){
        $test.status = "fail"
        $test.message = $_.Node.failure.message + "`n" + $_.Node.failure.'stack-trace'
    }

    $testlist.Add($test)
}

$test = @{
    version = 2
    status = "succes"
    tests = $testlist
}

if ($testlist | Where-Object { $_.status -eq "fail" }) {
    $test.status = "fail"
}

$jsonObject = $test | ConvertTo-Json

$jsonObject
