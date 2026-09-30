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
// * creationDate 1..1 dateTime "Date of first registration"

// FR: Statut actuel de l'épisode. Voir VS_EpisodeOfCare_Status.
// NL: Huidige status van de episode. Zie VS_EpisodeOfCare_Status.
* status 1..1 code "Current status of the episode" "planned | active | onhold | finished | cancelled | entered-in-error"
* status from http://hl7.org/fhir/ValueSet/episode-of-care-status (required)

// FR: Est le professionnel de la santé qui prend la responsabilité du contenu encodé.
// NL: De zorgprofessional die de verantwoordelijkheid neemt voor de geregistreerde inhoud.
* author 1..1 Reference "The healthcare professional who takes responsibility for the recorded content"

// FR: La période comprise entre le moment où la ressource est créée afin de regrouper les soins fournis et le moment où elle prend fin.
// NL: De periode tussen het moment dat de resource wordt gecreëerd om de verleende zorg te groeperen en het moment dat deze wordt opgeheven.
* period 1..1 Period "The period between the moment the resource is created to group the provided care and the moment it ends"

// FR: Le problème principal traité durant l'EpisodeOfCare. Voir VS_Encounter_Reason.
// NL: Het hoofdprobleem dat tijdens de EpisodeOfCare zal behandeld worden. Zie VS_Encounter_Reason.
* reason 1..1 BackboneElement "The main problem treated during the EpisodeOfCare"
* reason.reference 0..1 Reference "The main problem treated during the EpisodeOfCare, as a reference"
* reason.code 0..1 CodeableConcept "The main problem treated during the EpisodeOfCare, as a code"
* reason.code from http://hl7.org/fhir/ValueSet/encounter-reason (extensible)

// FR: Remarque complémentaire éventuelle.
// NL: Eventueel aanvullende opmerking.
* note 0..* Annotation "Optional additional remark"

// FR: Organisation responsable de la gestion et coordination de l'EpisodeOfCare du patient. Référence à la resource Organization.
// NL: Organisatie die verantwoordelijk is voor het beheer en coördinatie van de EpisodeOfCare van de patiënt.
* managingOrganization 0..1 Reference "Organization responsible for the management and coordination of the patient's EpisodeOfCare" "The organization responsible for the management and coordination of the patient's EpisodeOfCare. The responsibility is not shared: there is one responsible organization, or none."

// Other organizations involved in the EpisodeOfCare. Commented out for now.
// These are NOT managing organizations and carry NO responsibility for the
// management or coordination of the EpisodeOfCare - that responsibility belongs
// to managingOrganization above and is not divisible. They are merely other
// organizations taking part in the care grouped by this EpisodeOfCare.
// FR: Autres organisations impliquées dans l'EpisodeOfCare, sans responsabilité de gestion ni de coordination.
// NL: Andere organisaties die betrokken zijn bij de EpisodeOfCare, zonder verantwoordelijkheid voor beheer of coördinatie.
// * involvedOrganization 0..* Reference "Other organizations involved in the EpisodeOfCare, without management or coordination responsibility" "Organizations taking part in the care grouped by this EpisodeOfCare. They neither manage nor coordinate it and bear no responsibility for it; that is carried solely by managingOrganization."

// FR: L'équipe ou les équipes de soins qui participent à l'EpisodeOfCare. Référence à la resource CareTeam.
// NL: Het zorgteam of de zorgteams die deelnemen aan de EpisodeOfCare. Verwijzing naar de CareTeam resource.
* careTeam 0..* Reference "The care team(s) participating in the EpisodeOfCare"
