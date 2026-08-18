// =============================================================================
// Terminology for the CareSet ClinicalReport.
// Translations (fr / nl) are carried as concept designations.
// =============================================================================

// NOTE: VS_Status is intentionally NOT defined here. DiagnosticReport.status
// already carries a *required* binding to the HL7 FHIR value set
// http://hl7.org/fhir/ValueSet/diagnostic-report-status (final, partial,
// entered-in-error, ...), so the ClinicalReport reuses that FHIR value set
// directly instead of duplicating it.

// -----------------------------------------------------------------------------
// VS_Rep_Category - CareSet-specific classification of the report.
// Example placeholder code system for the draft spec; the binding is extensible
// so standardised (e.g. SNOMED CT) category codes may also be used.
// -----------------------------------------------------------------------------
CodeSystem: BeCSClinicalReportCategory
Id: be-cs-clinicalreport-category
Title: "BE CS ClinicalReport Category"
Description: "Example CareSet-specific categories classifying a ClinicalReport by clinical or functional meaning."
* ^status = #draft
* ^experimental = true
* ^caseSensitive = true
* #telemonitoring-report "Telemonitoring Report"
  * ^designation[+].language = #fr
  * ^designation[=].value = "Rapport de télémonitoring"
  * ^designation[+].language = #nl
  * ^designation[=].value = "Telemonitoringverslag"

ValueSet: BeVSClinicalReportCategory
Id: be-vs-clinicalreport-category
Title: "BE VS ClinicalReport Category"
Description: "Categories classifying a ClinicalReport. Extensible: standardised codes (e.g. SNOMED CT 394583002 | Endocrinology) may also be used."
* ^status = #draft
* ^experimental = true
* include codes from system BeCSClinicalReportCategory

// -----------------------------------------------------------------------------
// VS_Rep_Code - CareSet-specific report code.
// -----------------------------------------------------------------------------
CodeSystem: BeCSClinicalReportCode
Id: be-cs-clinicalreport-code
Title: "BE CS ClinicalReport Code"
Description: "Example CareSet-specific codes for a ClinicalReport, indicating the type of procedure that produces the primary values of the report."
* ^status = #draft
* ^experimental = true
* ^caseSensitive = true
* #telenews "News Project"
  * ^designation[+].language = #fr
  * ^designation[=].value = "Projet News"
  * ^designation[+].language = #nl
  * ^designation[=].value = "News-project"

ValueSet: BeVSClinicalReportCode
Id: be-vs-clinicalreport-code
Title: "BE VS ClinicalReport Code"
Description: "Codes for a ClinicalReport. Extensible: standardised codes (e.g. SNOMED CT 439926003 | Ambulatory continuous glucose monitoring of interstitial tissue fluid) may also be used."
* ^status = #draft
* ^experimental = true
* include codes from system BeCSClinicalReportCode

// NOTE: VS_Device is intentionally NOT defined here. As of V0.07 Device is no
// longer an element of the ClinicalReport; it is a transversal value set bound
// by the ClinicalObservation CareSet, which carries the device that produces
// the observations.
