cwlVersion: v1.0
steps:
  read-potential-cases-i2b2:
    run: read-potential-cases-i2b2.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule1
  carcinoma-in-situ_cervical-grade---primary:
    run: carcinoma-in-situ_cervical-grade---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule2
      potentialCases:
        id: potentialCases
        source: read-potential-cases-i2b2/output
  carcinoma-in-situ_cervical-cervix---primary:
    run: carcinoma-in-situ_cervical-cervix---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule3
      potentialCases:
        id: potentialCases
        source: carcinoma-in-situ_cervical-grade---primary/output
  vpersonal-carcinoma-in-situ_cervical---primary:
    run: vpersonal-carcinoma-in-situ_cervical---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule4
      potentialCases:
        id: potentialCases
        source: carcinoma-in-situ_cervical-cervix---primary/output
  glandular-carcinoma-in-situ_cervical---primary:
    run: glandular-carcinoma-in-situ_cervical---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule5
      potentialCases:
        id: potentialCases
        source: vpersonal-carcinoma-in-situ_cervical---primary/output
  carcinoma-in-situ_cervical-dyskaryosis---primary:
    run: carcinoma-in-situ_cervical-dyskaryosis---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule6
      potentialCases:
        id: potentialCases
        source: glandular-carcinoma-in-situ_cervical---primary/output
  carcinoma-in-situ_cervical-smear---primary:
    run: carcinoma-in-situ_cervical-smear---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule7
      potentialCases:
        id: potentialCases
        source: carcinoma-in-situ_cervical-dyskaryosis---primary/output
  carcinoma-in-situ_cervical-dysplasia---primary:
    run: carcinoma-in-situ_cervical-dysplasia---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule8
      potentialCases:
        id: potentialCases
        source: carcinoma-in-situ_cervical-smear---primary/output
  carcinoma-in-situ_cervical-neoplasia---primary:
    run: carcinoma-in-situ_cervical-neoplasia---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule9
      potentialCases:
        id: potentialCases
        source: carcinoma-in-situ_cervical-dysplasia---primary/output
  moderate-carcinoma-in-situ_cervical---primary:
    run: moderate-carcinoma-in-situ_cervical---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule10
      potentialCases:
        id: potentialCases
        source: carcinoma-in-situ_cervical-neoplasia---primary/output
  carcinoma-in-situ_cervical-uteri---primary:
    run: carcinoma-in-situ_cervical-uteri---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule11
      potentialCases:
        id: potentialCases
        source: moderate-carcinoma-in-situ_cervical---primary/output
  severe-carcinoma-in-situ_cervical---primary:
    run: severe-carcinoma-in-situ_cervical---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule12
      potentialCases:
        id: potentialCases
        source: carcinoma-in-situ_cervical-uteri---primary/output
  carcinoma---primary:
    run: carcinoma---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule13
      potentialCases:
        id: potentialCases
        source: severe-carcinoma-in-situ_cervical---primary/output
  carcinoma-in-situ_cervical-history---primary:
    run: carcinoma-in-situ_cervical-history---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule14
      potentialCases:
        id: potentialCases
        source: carcinoma---primary/output
  output-cases:
    run: output-cases.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule15
      potentialCases:
        id: potentialCases
        source: carcinoma-in-situ_cervical-history---primary/output
class: Workflow
inputs:
  inputModule1:
    id: inputModule1
    doc: Js implementation unit
    type: File
  inputModule2:
    id: inputModule2
    doc: Python implementation unit
    type: File
  inputModule3:
    id: inputModule3
    doc: Python implementation unit
    type: File
  inputModule4:
    id: inputModule4
    doc: Python implementation unit
    type: File
  inputModule5:
    id: inputModule5
    doc: Python implementation unit
    type: File
  inputModule6:
    id: inputModule6
    doc: Python implementation unit
    type: File
  inputModule7:
    id: inputModule7
    doc: Python implementation unit
    type: File
  inputModule8:
    id: inputModule8
    doc: Python implementation unit
    type: File
  inputModule9:
    id: inputModule9
    doc: Python implementation unit
    type: File
  inputModule10:
    id: inputModule10
    doc: Python implementation unit
    type: File
  inputModule11:
    id: inputModule11
    doc: Python implementation unit
    type: File
  inputModule12:
    id: inputModule12
    doc: Python implementation unit
    type: File
  inputModule13:
    id: inputModule13
    doc: Python implementation unit
    type: File
  inputModule14:
    id: inputModule14
    doc: Python implementation unit
    type: File
  inputModule15:
    id: inputModule15
    doc: Python implementation unit
    type: File
outputs:
  cases:
    id: cases
    type: File
    outputSource: output-cases/output
    outputBinding:
      glob: '*.csv'
requirements:
  SubworkflowFeatureRequirement: {}
