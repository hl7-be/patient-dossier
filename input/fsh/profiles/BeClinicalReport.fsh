// =============================================================================
// Profile: BeClinicalReport - CareSet ClinicalReport on DiagnosticReport (R4).
// Belgian naming conventions (BeClinicalReport / be-clinicalreport) and reuse of
// the eHealth Federal Core (hl7.fhir.be.core#2.1.2): BePatient, BePractitioner,
// BePractitionerRole, BeOrganization, BeExtRecorder, BeExtSimpleNote.
// Every element of the BeModelClinicalReport logical model is covered here and,
// per the Belgian conventions, flagged Must Support (MS).
//   businessIdentifier -> identifier            note                 -> extension[note] (BeExtSimpleNote)
//   basedOn            -> basedOn               document             -> presentedForm
//   recordedDate       -> extension[recordedDate]   status           -> status
//   observationPeriod  -> effectivePeriod       recorder             -> extension[recorder] (BeExtRecorder)
//   patient            -> subject (BePatient)   device               -> extension[device]
//   interpreter        -> resultsInterpreter    clinicalObservations -> result
//   category           -> category              diagnosis            -> conclusionCode
//   code               -> code
// =============================================================================

Profile: BeClinicalReport
Parent: DiagnosticReport
Id: be-clinicalreport
Title: "BE ClinicalReport"
Description: "CareSet ClinicalReport: a clinical report that collects the essential information for the follow-up of a patient over a defined period, consolidates the referenced clinical observations, reports and documents around a well-defined medical context, and may carry a clinical interpretation. Based on the international DiagnosticReport resource and the Belgian eHealth Federal Core profiles."
* ^status = #draft
* ^experimental = true

// --- Extensions: reuse be-core (recorder, note); local for recordedDate, device
* extension contains
    BeExtRecordedDate named recordedDate 1..1 MS and
    $BeExtRecorder named recorder 1..1 MS and
    BeExtReportDevice named device 0..1 MS and
    $BeExtSimpleNote named note 0..* MS
* extension[recordedDate] ^short = "Date the report was recorded / last updated (RecordedDate)"
* extension[recorder] ^short = "Who recorded the report (Recorder)"
* extension[device] ^short = "Medical device used to create the observations (Device)"
* extension[note] ^short = "Free-text additional information (Note)"

// --- businessIdentifier -> identifier ---
* identifier 1..* MS
* identifier ^short = "Business identifier of the report"

// --- basedOn ---
* basedOn 0..1 MS
* basedOn ^short = "Reference to the request underlying the report"

// --- status (required binding to the FHIR value set is reused as-is) ---
* status MS
* status ^short = "Status of the report (default: final)"

// --- category -> category ---
* category 1..* MS
* category from BeVSClinicalReportCategory (extensible)
* category ^short = "Clinical/functional classification of the report"

// --- code -> code ---
* code 1..1 MS
* code from BeVSClinicalReportCode (extensible)
* code ^short = "Code of the report"

// --- patient -> subject (BePatient) ---
* subject 1..1 MS
* subject only Reference($BePatient)
* subject ^short = "The patient the report is about"

// --- observationPeriod -> effectivePeriod ---
* effective[x] 1..1 MS
* effective[x] only Period
* effectivePeriod.start 1..1 MS
* effectivePeriod.end 1..1 MS
* effective[x] ^short = "Period the report covers"

// --- interpreter -> resultsInterpreter (be-core practitioner/role/org) ---
* resultsInterpreter 0..1 MS
* resultsInterpreter only Reference($BePractitioner or $BePractitionerRole or $BeOrganization)
* resultsInterpreter ^short = "Who interprets the observations of the report"

// --- clinicalObservations -> result ---
* result MS
* result ^short = "Referenced clinical observations"

// --- diagnosis -> conclusionCode ---
* conclusionCode MS
* conclusionCode ^short = "Diagnosis / problem concluded from the report"

// --- document -> presentedForm ---
* presentedForm 0..1 MS
* presentedForm ^short = "PDF document of the complete report"
