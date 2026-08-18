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
//   interpreter        -> resultsInterpreter    diagnosis            -> conclusionCode
//   category           -> category              code                 -> code
//   interpretation     -> extension[interpretation] (conclusion) + conclusionCode
// Per V0.07: Device is no longer an element of the report - the device that
// produces the observations is carried by the ClinicalObservation CareSet.
// Note on interpretation/diagnosis: DiagnosticReport has no element for a
// Reference(Condition) in any version, and conclusionCode is defined as "codes
// that represent the summary conclusion (interpretation/impression) of the
// report", so both the diagnosis codes and the coded form of the interpretation
// are carried by conclusionCode.
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

// --- interpretation -> conclusion (free text) ---
// R4's conclusion is 0..1 while the model says 0..*; the repeats therefore live
// in conclusionCode below. Preadopting a repeating conclusion via the
// same-version extension http://hl7.org/fhir/4.0/StructureDefinition/
// extension-DiagnosticReport.conclusion is not possible today: SUSHI resolves
// that URL only from a package named hl7.fhir.uv.xver-r4.r4, which is not
// published (xver packages exist only for differing version pairs).
* conclusion 0..1 MS
* conclusion ^short = "Clinical conclusion (interpretation) of the results, as free text"

// --- diagnosis + coded interpretation -> conclusionCode ---
* conclusionCode MS
* conclusionCode ^short = "Diagnosis and/or coded clinical interpretation concluded from the report"

// --- document -> presentedForm ---
* presentedForm 0..1 MS
* presentedForm ^short = "PDF document of the complete report"
