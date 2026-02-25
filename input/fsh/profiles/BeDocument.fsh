Profile: BeDocument
Parent: Bundle
Id: be-document
Title: "BeDocument Bundle"
Description: "Minimal document Bundle profile for BeDocument."

* type 1..1
* type = #document

* identifier 0..1 MS

* timestamp 0..1 MS

* entry 1..* MS
* entry.resource 1..1 MS 

* entry 1..* MS
* entry ^slicing.discriminator[0].type = #profile
* entry ^slicing.discriminator[0].path = "resource"
* entry ^slicing.rules = #open

* entry contains
    composition 1..1 MS and
    careSet 0..* MS

* entry[composition].resource 1..1
//* entry[composition].resource only BeModelDocumentComposition
* entry[composition].resource MS

// “careSet” entries are the referenced resources; keep unconstrained but visible
* entry[careSet].resource 1..1 MS
