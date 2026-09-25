Alias: $BeExtCodeableReference = https://www.ehealth.fgov.be/standards/fhir/core/StructureDefinition/be-ext-codeable-reference
Alias: $BeExtRecordedDate = https://www.ehealth.fgov.be/standards/fhir/core/StructureDefinition/be-ext-recorded-date
Alias: $BeExtRecorder = https://www.ehealth.fgov.be/standards/fhir/core/StructureDefinition/be-ext-recorder
Alias: $BeExtSimpleNote = https://www.ehealth.fgov.be/standards/fhir/core/StructureDefinition/be-ext-simple-note

Profile: BeEpisodeOfCare
Parent: EpisodeOfCare
Id: be-episode-of-care
Title: "BeEpisodeOfCare"
Description: "EpisodeOfCare profile realising the BeModelEpisodeOfCare logical model. Every element of the model is represented, either as a native EpisodeOfCare element or as an extension, and flagged as Must Support."

// identifier -> Unique Business Identifier of the CareSet
* identifier 1..* MS

// patient -> The person who is the subject of the healthcare
* patient only Reference(BePatient)
* patient 1..1 MS

// status -> Current status of the episode (base already binds episode-of-care-status, required)
* status 1..1 MS

// period -> The period during which the resource groups the provided care
* period 1..1 MS

// careTeam -> team
// R4 EpisodeOfCare.team is already 0..* Reference(CareTeam) "Other practitioners
// facilitating this episode of care", so only Must Support is added. It still
// targets base CareTeam: BeCareTeam lives on the careplan-team branch and is not
// available in this IG yet.
* team 0..* MS

// managingOrganization -> the organization responsible for the management and
// coordination of the EpisodeOfCare. FHIR caps this at 0..1 in R4 and R5 alike,
// which matches the model: the responsibility is not shared.
* managingOrganization only Reference(BeOrganization)
* managingOrganization 0..1 MS

// involvedOrganization -> other organizations taking part in the EpisodeOfCare.
// Commented out for now, together with the matching model element.
// These are explicitly NOT managing organizations: they carry no management or
// coordination responsibility for the EpisodeOfCare. That responsibility is not
// divisible and stays on managingOrganization above, so these values must never be
// carried by a managingOrganization extension - hence a local extension of its own
// rather than the cross-version extension-EpisodeOfCare.managingOrganization
// (which would also not resolve: managingOrganization is 0..1 in R4 *and* R5, so
// the xver packages publish no extension for it).
// * extension contains BeEpisodeOfCareInvolvedOrganization named involvedOrganization 0..* MS
// * extension[involvedOrganization].value[x] only Reference(BeOrganization)
// * extension[involvedOrganization] ^short = "Other organization involved in the EpisodeOfCare, without management or coordination responsibility"

// Model elements with no native R4 EpisodeOfCare equivalent -> extensions
// author -> be-core BeExtRecorder ; note -> be-core BeExtSimpleNote
// recordedDate -> be-core BeExtRecordedDate (published from be-core 2.2.0)
// reason -> be-core BeExtCodeableReference, the R4 backport of CodeableReference.
//   R4 EpisodeOfCare has no `reason` at all (it only offers diagnosis.condition, a
//   bare Reference(Condition)), so the model's reason.reference / reason.code pair
//   is carried by one extension whose sub-extensions are reference / concept.
//   1..1: exactly one main reason per episode.
// creationDate is commented out in the model, so no slice is declared for it.
// If it comes back, add: BeCareSetCreated named creationDate 1..1 MS
* extension contains
    $BeExtRecordedDate named recordedDate 1..1 MS and
    $BeExtRecorder named author 1..1 MS and
    $BeExtCodeableReference named reason 1..1 MS and
    $BeExtSimpleNote named note 0..* MS
* extension[reason] ^short = "The main problem treated during the EpisodeOfCare"
* extension[reason].extension[reference].value[x] only Reference(Condition)
* extension[reason].extension[concept].value[x] from http://hl7.org/fhir/ValueSet/encounter-reason (extensible)
