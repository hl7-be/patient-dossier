// =============================================================================
// Profile: BeClinicalReport - CareSet ClinicalReport on DiagnosticReport (R4).
// Belgian naming conventions (BeClinicalReport / be-clinicalreport) and reuse of
// the eHealth Federal Core (hl7.fhir.be.core): BePatient, BePractitioner,
// BePractitionerRole, BeOrganization, BeExtRecorder, BeExtRecordedDate,
// BeExtSimpleNote.
// Every element of the BeModelClinicalReport logical model is covered here and,
// per the Belgian conventions, flagged Must Support (MS).
//   businessIdentifier -> identifier            note                 -> extension[note] (BeExtSimpleNote)
//   basedOn            -> basedOn               document             -> presentedForm
//   recordedDate       -> extension[recordedDate] (BeExtRecordedDate) status -> status
//   observationPeriod  -> effectivePeriod       recorder             -> extension[recorder] (BeExtRecorder)
//   patient            -> subject (BePatient)   clinicalObservations -> result
//   interpreter        -> resultsInterpreter    category             -> category
//   interpretation     -> conclusion (text)     code                 -> code
//   conclusion         -> conclusionCode (coded)
// Per V0.07: Device is no longer an element of the report - the device that
// produces the observations is carried by the ClinicalObservation CareSet.
// The model splits the former single 'interpretation' element in two: a free-text
// interpretation (0..1 string) and a coded clinical conclusion (0..* CodeableConcept),
// which map onto DiagnosticReport.conclusion and DiagnosticReport.conclusionCode
// respectively. 'diagnosis' is no longer an element of the model.
// =============================================================================

Profile: BeClinicalReport
Parent: DiagnosticReport
Id: be-clinicalreport
Title: "BE ClinicalReport"
Description: "CareSet ClinicalReport: a clinical report that collects the essential information for the follow-up of a patient over a defined period, consolidates the referenced clinical observations, reports and documents around a well-defined medical context, and may carry a clinical interpretation. Based on the international DiagnosticReport resource and the Belgian eHealth Federal Core profiles."
* ^status = #draft
* ^experimental = true

// --- Extensions: reuse be-core (recordedDate, recorder, note)
* extension contains
    $BeExtRecordedDate named recordedDate 1..1 MS and
    $BeExtRecorder named recorder 1..1 MS and
    $BeExtSimpleNote named note 0..* MS
* extension[recordedDate] ^short = "Date the report was recorded / last updated (RecordedDate)"
* extension[recorder] ^short = "Who recorded the report (Recorder)"
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
* category 0..* MS
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

// --- interpretation -> conclusion (free text) ---
// The textual interpretation is 0..1; a report carries at most one free-text
// interpretation. The coded conclusions repeat in conclusionCode below.
* conclusion 0..1 MS
* conclusion ^short = "Textual interpretation of the observations and/or the thought process that leads to a conclusion"

// --- conclusion -> conclusionCode ---
* conclusionCode MS
* conclusionCode ^short = "Clinical conclusion (interpretation) of the results"

// --- document -> presentedForm ---
* presentedForm 0..1 MS
* presentedForm ^short = "PDF document of the complete report"
