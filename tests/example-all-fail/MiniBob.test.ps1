BeforeAll {
    . ".\MiniBob.ps1"
}

Describe "Test Get-BobResponse" {

    It "stating something" {
        hey -HeyBob "Tom-ay-to, tom-aaaah-to." | Should -BeExactly "Whatever."
    }

    It "shouting" {
       hey -HeyBob "WATCH OUT!" | Should -BeExactly "Whoa, chill out!"
    }

}