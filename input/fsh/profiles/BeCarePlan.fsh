Profile: BeCarePlan
Parent: CarePlan
Id: be-care-plan
Title: "BeCarePlan"
Description: "CarePlan profile realising the BeModelCarePlan logical model. Every element of the model is represented, either as a native CarePlan element or as an extension, and flagged as Must Support."

// identifier -> Unique Business Identifier of the CareSet
* identifier 1..* MS

// author -> healthcare professional responsible for the recorded content
* author 1..1 MS

// status -> registration status / lifecycle (base binds request-status, required)
* status 1..1 MS

// created -> moment the CareSet was created
* created 0..1 MS

// period -> time period for which this CareSet is valid
* period 0..1 MS

// category -> type of care plan (base binds care-plan-category)
* category 0..* MS

// note -> additional free-text information
* note 0..* MS

// activity -> actions planned/performed
* activity 0..* MS

// goal -> the goal(s) this CareSet aims to achieve
* goal 0..* MS

// addresses -> condition/problem for which the CareSet was set up
// Note: the model allows Condition/Procedure; base R4 addresses is Reference(Condition) only
* addresses 0..* MS

// careTeam -> the team involved in the actions
* careTeam 0..* MS

// patient -> the subject of the care
* subject 1..1 MS

// encounter -> the encounter referencing this CareSet
// * encounter 0..1 MS

// description -> description of the CarePlan
* description 0..1 MS

// title -> title of the CarePlan
* title 0..1 MS

// replaces -> previous version of the CarePlan this one replaces
* replaces 0..* MS

// basedOn -> the CarePlan this one is based on
* basedOn 0..* MS

// partOf -> the parent CareSet this CareSet is part of
* partOf 0..1 MS

// contributor -> the person(s) who add content to the CarePlan
* contributor 0..* MS

// intent -> intent of the CarePlan (base binds care-plan-intent, required)
* intent 1..1 MS

// recordedDate -> no native CarePlan equivalent -> extension
* extension contains
    BeCareSetRecordedDate named recordedDate 1..1 MS
