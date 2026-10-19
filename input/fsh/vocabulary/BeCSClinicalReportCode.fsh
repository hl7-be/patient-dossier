// =============================================================================
// VS_Rep_Code - CareSet-specific ClinicalReport code, indicating the type of
// procedure that produces the primary values of the report.
// Example placeholder code system for the draft spec.
// Translations (fr / nl) are carried as concept designations.
// =============================================================================

CodeSystem: BeCSClinicalReportCode
Id: be-cs-clinicalreport-code
Title: "ClinicalReport Code"
Description: "Example CareSet-specific codes for a ClinicalReport, indicating the type of procedure that produces the primary values of the report."
* ^status = #draft
* ^experimental = true
* ^caseSensitive = true
* #telenews "News Project"
  * ^designation[+].language = #fr
  * ^designation[=].value = "Projet News"
  * ^designation[+].language = #nl
  * ^designation[=].value = "News-project"
