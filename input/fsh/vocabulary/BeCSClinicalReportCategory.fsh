// =============================================================================
// VS_Rep_Category - CareSet-specific classification of the ClinicalReport.
// Example placeholder code system for the draft spec; the binding on the profile
// is extensible, so standardised (e.g. SNOMED CT) category codes may also be
// used. Translations (fr / nl) are carried as concept designations.
// =============================================================================

CodeSystem: BeCSClinicalReportCategory
Id: be-cs-clinicalreport-category
Title: "ClinicalReport Category"
Description: "Example CareSet-specific categories classifying a ClinicalReport by clinical or functional meaning."
* ^status = #draft
* ^experimental = true
* ^caseSensitive = true
* #telemonitoring-report "Telemonitoring Report"
  * ^designation[+].language = #fr
  * ^designation[=].value = "Rapport de télémonitoring"
  * ^designation[+].language = #nl
  * ^designation[=].value = "Telemonitoringverslag"
