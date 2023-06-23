BeforeAll {
    . ".\MiniBob.ps1"
}

Describe "Test Get-BobResponse" {

    It "stating something" {
        hey -HeyBob "Tom-ay-to, tom-aaaah-to." | Should -BeExactly "Whatever."
    }

    It "shouting" {
       hey -HeyBob "" | Should -BeExactly "Fine. Be that way!"
    }

}