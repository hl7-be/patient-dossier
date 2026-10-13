// =============================================================================
// VS_Rep_Category - categories classifying a ClinicalReport.
// Codes are drawn from BeCSClinicalReportCategory; the binding on the profile is
// extensible, so standardised codes may also be used.
// =============================================================================

ValueSet: BeVSClinicalReportCategory
Id: be-vs-clinicalreport-category
Title: "BE VS ClinicalReport Category"
Description: "Categories classifying a ClinicalReport. Extensible: standardised codes (e.g. SNOMED CT 394583002 | Endocrinology) may also be used."
* ^status = #draft
* ^experimental = true
* include codes from system BeCSClinicalReportCategory
