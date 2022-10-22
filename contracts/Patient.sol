// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.4;

import "hardhat/console.sol";

contract Patient is ERC721 {
  // from Resource: id, meta, implicitRules, and language
  // from DomainResource: text, contained, extension, and modifierExtension
  Identifier identifier; // An identifier for this patient
  bool active; // Whether this patient's record is in active use
  HumanName name; // A name associated with the patient
  ContactPoint telecom; // A contact detail for the individual
  Gender gender; // male | female | other | unknown
  Date birthDate; // The date of birth for the individual
  // deceased[x]: Indicates if the individual is deceased or not. One of these 2:
  bool deceasedBoolean;
  DateTime deceasedDateTime;
  Address address; // An address for the individual
  CodeableConcept maritalStatus; // Marital (civil) status of a patient
  // multipleBirth[x]: Whether patient is part of a multiple birth. One of these 2:
  bool multipleBirthBoolean;
  uint multipleBirthInteger;
  Attachment photo; // Image of the patient
  "contact" : [{ // A contact party (e.g. guardian, partner, friend) for the patient
    "relationship" : [{ CodeableConcept }], // The kind of relationship
    "name" : { HumanName }, // A name associated with the contact person
    "telecom" : [{ ContactPoint }], // A contact detail for the person
    "address" : { Address }, // Address for the contact person
    "gender" : "<code>", // male | female | other | unknown
    "organization" : { Reference(Organization) }, // C? Organization that is associated with the contact
    "period" : { Period } // The period during which this contact person or organization is valid to be contacted relating to this patient
  }],
  "communication" : [{ // A language which may be used to communicate with the patient about his or her health
    "language" : { CodeableConcept }, // R!  The language which can be used to communicate with the patient about his or her health
    "preferred" : <boolean> // Language preference indicator
  }],
  Reference generalPractitioner; // Patient's nominated primary care provider
  Reference managingOrganization; // Organization that is the custodian of the patient record
  "link" : [{ // Link to another patient resource that concerns the same actual person
    "other" : { Reference(Patient|RelatedPerson) }, // R!  The other patient or related person resource that the link refers to
    "type" : "<code>" // R!  replaced-by | replaces | refer | seealso
  }]

    constructor(string memory _greeting) {
        console.log("Deploying a Greeter with greeting:", _greeting);
        greeting = _greeting;
    }
}
