Logical: BeModelEpisodeOfCare
Id: be-model-episode-of-care
Title: "BeEpisodeOfCare model"
Description: "Logical model for the EpisodeOfCare CareSet - represents a period during which care related to a specific goal or problem is provided to a patient by one or more healthcare providers and/or organizations."
Characteristics: #can-be-target

// FR: Identifiant Business unique du CareSet
// NL: Unieke Business Identifier van de CareSet
* identifier 1..* Identifier "Unique Business Identifier of the CareSet"

// FR: La personne qui est l'objet des soins de santé auxquels l'enregistrement (EpisodeOfCare) fait référence (NISS, BIS ou autre identification autorisée).
// NL: De persoon die het onderwerp is van de gezondheidszorg waarnaar het dossier (EpisodeOfCare) verwijst (NISS, BIS of andere geautoriseerde identificatie).
* patient 1..1 Reference "The person who is the subject of the healthcare to which the record refers (NISS, BIS or other authorised identification)"

// FR: Date d'encodage de l'enregistrement par l'Author ou le Recorder (date de la dernière mise à jour). Permet la gestion de l'historisation du CareSet via le couple Business Identifier - RecordedDate.
// NL: Registratiedatum door de Author of Recorder (datum van laatste update). Maakt CareSet-geschiedenisbeheer mogelijk via het paar Business Identifier - RecordedDate.
* recordedDate 1..1 dateTime "Recording date by the Author or Recorder (date of last update)" "Enables CareSet history management via the pair Business Identifier - RecordedDate, which guarantees access to the latest version of the content"

// FR: Date du premier enregistrement (jj/mm/aaaa).
// NL: Datum van eerste registratie (dd/mm/yyyy).
* creationDate 1..1 dateTime "Date of first registration"

// FR: Statut actuel de l'épisode. Voir VS_EpisodeOfCare_Status.
// NL: Huidige status van de episode. Zie VS_EpisodeOfCare_Status.
* status 1..1 code "Current status of the episode" "planned | active | onhold | finished | cancelled | entered-in-error"
* status from http://hl7.org/fhir/ValueSet/episode-of-care-status (required)

// FR: Est le professionnel de la santé qui prend la responsabilité du contenu encodé.
// NL: De zorgprofessional die de verantwoordelijkheid neemt voor de geregistreerde inhoud.
* author 1..1 Reference "The healthcare professional who takes responsibility for the recorded content"

// FR: La période comprise entre le moment où la ressource est créée afin de regrouper les soins fournis et le moment où elle prend fin.
// NL: De periode tussen het moment dat de resource wordt gecreëerd om de verleende zorg te groeperen en het moment dat deze wordt opgeheven.
* period 0..1 Period "The period between the moment the resource is created to group the provided care and the moment it ends"

// FR: Le problème traité durant l'EpisodeOfCare. Voir VS_Encounter_Reason.
// NL: Het probleem dat tijdens de EpisodeOfCare zal behandeld worden. Zie VS_Encounter_Reason.
* reason 1..* Reference "The problem treated during the EpisodeOfCare"
* reason from http://hl7.org/fhir/ValueSet/encounter-reason (extensible)

// FR: Remarque complémentaire éventuelle.
// NL: Eventueel aanvullende opmerking.
* note 0..* Annotation "Optional additional remark"

// FR: Organisation responsable de la gestion et coordination de l'EpisodeOfCare du patient. Référence à la resource Organization.
// NL: Organisatie die verantwoordelijk is voor het beheer en coördinatie van de EpisodeOfCare van de patiënt.
* managingOrganization 0..* Reference "Organization responsible for the management and coordination of the patient's EpisodeOfCare"
