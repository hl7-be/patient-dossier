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
* patient 1..1 MS

// status -> Current status of the episode (base already binds episode-of-care-status, required)
* status 1..1 MS

// period -> The period during which the resource groups the provided care
* period 0..1 MS

// reason -> The problem treated during the EpisodeOfCare
// R4 has no `reason`; the problem is carried by diagnosis.condition (Reference(Condition))
* diagnosis 1..* MS
* diagnosis.condition 1..1 MS

// managingOrganization -> Organization responsible for management and coordination
// Note: the model allows 0..*, but the base R4 EpisodeOfCare caps this at 0..1
* managingOrganization 0..1 MS

// Model elements with no native R4 EpisodeOfCare equivalent -> extensions
// author -> be-core BeExtRecorder ; note -> be-core BeExtSimpleNote
* extension contains
    BeCareSetRecordedDate named recordedDate 1..1 MS and
    BeCareSetCreated named creationDate 1..1 MS and
    $BeExtRecorder named author 1..1 MS and
    $BeExtSimpleNote named note 0..* MS
