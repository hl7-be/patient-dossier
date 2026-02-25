Profile: ChildReport
Parent: Bundle

* type = #document (exactly)
* timestamp 1.. MS

* identifier 1.. MS


* entry ^slicing.discriminator[0].type = #type
* entry ^slicing.discriminator[=].path = "resource"
* entry ^slicing.discriminator[+].type = #profile
* entry ^slicing.discriminator[=].path = "resource"
* entry ^slicing.rules = #open
* entry ^short = "Entry resource in the patient summary bundle"
* entry ^definition = "An entry resource included in the patient summary document bundle resource."
* entry ^comment = "Must contain the Composition as the first entry (only a single Composition resource instance may be included) and a Patient resource."
* entry.fullUrl 1.. MS
* entry.search ..0
* entry.request ..0
* entry.response ..0
* entry contains
    composition 1..1 and
    patient 1..1 and
    relatedPerson 1..1 and
    pregnancyDuration 0..1 and
    pregnancyCMVInfection 0..1 and
    pregnancyBacterialMeningitis 0..1 and
    neonatalHearingScreening 0..* and
    neonatalHearingScreeningLeft 0..1 and
    neonatalHearingScreeningRight 0..1 and
    severeHeadTrauma 0..1 and
    eyeScreening 0..* and
    inspectionPupilAbnormal 0..1 and
    eyeMovementAndPosition 0..1 and
    eyeRemarks 0..1 and
    inTreatmentWithOphthalmologist 0..*
//    beRefusalOfHearingTest 0..1


* entry[composition].resource 1..
* entry[composition].resource only BeChildRecordComposition
* entry[composition] MS
* entry[patient].resource 1..
* entry[patient].resource only BePatient
* entry[patient] MS

* entry[relatedPerson].resource 1..
* entry[relatedPerson].resource only RelatedPerson
* entry[relatedPerson] MS

* entry[neonatalHearingScreeningLeft].resource 1..
* entry[neonatalHearingScreeningLeft].resource only BeNeonatalHearingScreeningLeft
* entry[neonatalHearingScreeningLeft] MS

* entry[neonatalHearingScreeningRight].resource 1..
* entry[neonatalHearingScreeningRight].resource only BeNeonatalHearingScreeningRight
* entry[neonatalHearingScreeningRight] MS
