// =============================================================================
// VS_Rep_Code - codes for a ClinicalReport.
// Codes are drawn from BeCSClinicalReportCode; the binding on the profile is
// extensible, so standardised codes may also be used.
// =============================================================================

ValueSet: BeVSClinicalReportCode
Id: be-vs-clinicalreport-code
Title: "BE VS ClinicalReport Code"
Description: "Codes for a ClinicalReport. Extensible: standardised codes (e.g. SNOMED CT 439926003 | Ambulatory continuous glucose monitoring of interstitial tissue fluid) may also be used."
* ^status = #draft
* ^experimental = true
* include codes from system BeCSClinicalReportCode
