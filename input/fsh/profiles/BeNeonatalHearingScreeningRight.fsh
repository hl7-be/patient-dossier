Profile: BeNeonatalHearingScreeningRight
Parent: BeObservation
Title: "Neonatal Hearing Screening - Right Ear"
Description: "Observation for neonatal hearing screening result for the right ear."

* code 1.. MS
* code = #neonatal-hearing-screening-right "Result of neonatal hearing screening (right ear)"
* subject 1..1 MS
* subject only Reference(BePatient)
* effective[x] only dateTime
* effectiveDateTime 1..1 MS
* value[x] only CodeableConcept
* valueCodeableConcept 1..1 MS
* valueCodeableConcept from VSNeonatalHearingScreeningResults
