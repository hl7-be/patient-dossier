Logical: BeModelCarePlan
Id: be-model-care-plan
Title: "BeCarePlan model"
Description: "Logical model for the CarePlan CareSet - describes the care that is (to be) delivered to a patient by one or more healthcare providers, gathering goals, activities and care teams, optionally linked to a specific health problem."
Characteristics: #can-be-target

// Unieke Business Identifier van de CareSet
* identifier 1..* Identifier "Unique Business Identifier of the CareSet"

// Registratiedatum door de Author of Recorder (datum van laatste update)
* recordedDate 1..1 dateTime "Recording date by the Author or Recorder (date of last update)" "Enables CareSet history management via the pair Business Identifier - RecordedDate, which guarantees access to the latest version of the content"

// De zorgprofessional die de verantwoordelijkheid neemt voor de geregistreerde inhoud
* author 1..1 Reference "The healthcare professional who takes responsibility for the recorded content"

// Geeft de registratiestatus aan, het moment in de levenscyclus. Zie VS_Status
* status 1..1 code "Registration status / lifecycle moment" "draft | active | on-hold | completed | revoked | entered-in-error"
* status from http://hl7.org/fhir/ValueSet/request-status (required)

// Moment waarop de CareSet werd aangemaakt
* created 0..1 dateTime "Moment the CareSet was created"

// Tijdsperiode waarvoor deze CareSet geldig is
* period 0..1 Period "Time period for which this CareSet is valid"

// Identificeert welk type zorgplan de CareSet omvat. Zie VS_CarePlan_Category
* category 0..1 CodeableConcept "Identifies the type of care plan this CareSet represents"
* category from http://hl7.org/fhir/ValueSet/care-plan-category (extensible)

// Aanvullende informatie met betrekking tot de CareSet-inhoud in vrije tekstvorm
* note 0..* Annotation "Additional free-text information about the CareSet content"

// Identificeert welke handelingen er in deze CareSet worden gepland/werden uitgevoerd
* activity 0..* Reference "Actions planned/performed within this CareSet"

// De doelstelling die met deze CareSet wil bereikt worden. Verwijst naar de resource Goal
* goal 0..* Reference "The goal(s) this CareSet aims to achieve"

// De aandoening/het probleem waarvoor deze CareSet werd opgezet. Verwijst naar Condition/Procedure
* addresses 0..* Reference "The condition/problem for which this CareSet was set up"

// Het team dat betrokken is bij de handelingen. Verwijst naar de resource CareTeam
* careTeam 0..* Reference "The team involved in the actions of this CareSet"

// De persoon die het onderwerp is van de zorgen. Verwijst naar de resource Patient
* patient 1..1 Reference "The person who is the subject of the care referenced in this CareSet"

// De contacten met zorgverleners waarin verwezen wordt naar deze CareSet
* encounter 0..1 Reference "The encounter referencing this CareSet"

// Beschrijving van het CarePlan
* description 0..1 string "Description of the CarePlan"

// Benaming van het CarePlan
* title 0..1 string "Title of the CarePlan"

// De vorige versie van het CarePlan dat dit CarePlan vervangt
* replaces 0..* Reference "The previous version of the CarePlan that this CarePlan replaces"

// Verwijst naar het CarePlan waarop het huidige CarePlan gebaseerd is
* basedOn 0..* Reference "The CarePlan this CarePlan is based on (does not replace it)"

// De CareSet waarvan deze CareSet deel uitmaakt (bovenliggende CareSet)
* partOf 0..1 Reference "The parent CareSet this CareSet is part of"

// De persoon die inhoud aan het CarePlan toevoegt. Practitioner/Patient/RelatedPerson
* contributor 0..* Reference "The person who adds content to the CarePlan"

// Duidt de intentie van het CarePlan. Zie VS_CarePlan_Intent
* intent 1..1 code "Intent of the CarePlan" "proposal | plan | order | option"
* intent from http://hl7.org/fhir/ValueSet/care-plan-intent (required)
