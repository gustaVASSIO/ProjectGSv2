import { SourcetypeService } from './../../../controllers/sourcetype.service';
import { Component } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { forkJoin } from 'rxjs';
import { DepartmentService } from 'src/app/controllers/department.service';
import { IdeasourceService } from 'src/app/controllers/ideasource.service';
import { ImproveService } from 'src/app/controllers/improve.service';
import { InfoFinantialService } from 'src/app/controllers/infoFinantial.service';
import { MajorbenefitsService } from 'src/app/controllers/majorbenefits.service';
import { UserService } from 'src/app/controllers/user.service';
import Department from 'src/app/models/department.model';
import IdeaSource from 'src/app/models/ideasource.model';
import Improve from 'src/app/models/improve.model';
import MajorBenefits from 'src/app/models/majorbenefits.model';
import SourceType from 'src/app/models/sourcetype.model';
import { FTE } from 'src/app/shared/FTE';
import Message from 'src/app/shared/message';

@Component({
  selector: 'app-create-improve',
  templateUrl: './create-improve.component.html',
  styleUrls: ['./create-improve.component.css'],
  providers: [
    DepartmentService,
    MajorbenefitsService,
    SourcetypeService,
    IdeasourceService,
    ImproveService,
    InfoFinantialService
  ]
})
export class CreateImproveComponent {
  departments?: Department[]
  majorbenefits?: MajorBenefits[]
  sourcetypes?: SourceType[]
  ideasources?: IdeaSource[]
  departmentDependencies ?: Department
  public message : Message = new Message(this.router)

  formImprove: FormGroup = new FormGroup({
    "summary": new FormControl(undefined, [Validators.required]),
    "description": new FormControl(undefined, [Validators.required]),
    "userId": new FormControl({ value: undefined, disabled: true }),
    "assignee": new FormControl(undefined, [Validators.required]),
    "dueDate": new FormControl(undefined, [Validators.required]),
    "components": new FormControl(undefined, [Validators.required]),
    "sourceTypeId": new FormControl(undefined, [Validators.required]),
    // ------------------------------------------------------------
    "region": new FormControl({value: "LA",  disabled: true}),
    "departmentId": new FormControl(undefined, [Validators.required]),
    "currentOrganization": new FormControl({ value: undefined, disabled: true }),
    "process": new FormControl({ value: undefined, disabled: true }),
    "costCenter": new FormControl({ value: undefined, disabled: true }),
    "affectEntities": new FormControl(undefined, [Validators.required]),
    // ------------------------------------------------------------
    "ideaSourceId": new FormControl(undefined, [Validators.required]),
    "cipPex": new FormControl(undefined, [Validators.required]),
    "currency": new FormControl(undefined, [Validators.required]),
    "priority": new FormControl(undefined, [Validators.required]),
    "majorBenefitsId": new FormControl(undefined, [Validators.required]),
    "estimatedHours": new FormControl({value: undefined, disabled: true}),
    "estimatedSaving": new FormControl({ value: undefined, disabled: true }),
    "monetaryBenefit": new FormControl({ value: undefined, disabled: true }),
  })

  constructor(
    private departmentService: DepartmentService,
    private majorbenefitsService: MajorbenefitsService,
    private sourcetypesService: SourcetypeService,
    private idesourcesService: IdeasourceService,
    private improveService: ImproveService,
    private infoFinantialService: InfoFinantialService,
    private userService : UserService,
    private router: Router
  ) { }

  ngOnInit() {
    this.loadDependencies()
    this.formImprove.get("userId")?.patchValue(this.userService.userLoged?.userName.toUpperCase())
  }

  public verifyEstimatedHours(): boolean {
    if (this.formImprove.get("majorBenefitsId")?.value == '11527ad8-5fed-4e6e-befe-f7e2be9137be') {
      this.formImprove.controls['estimatedHours'].enable()
      return true
    }
    return false
  }
  public verifyEstimatedSaving(): boolean {
    if (this.formImprove.get("majorBenefitsId")?.value == '11527ad8-5fed-4e6e-befe-f7e2be9137be') {
      return true
    }
    return false
  }
  public verifyMonetaryBenefit(): boolean {
    const majorBenefit = this.formImprove.get("majorBenefitsId")?.value
    if (majorBenefit == '11527ad8-5fed-4e6e-befe-f7e2be9137be') {
      this.formImprove.controls['monetaryBenefit'].disable()
      return true
    }
    if (
      majorBenefit == '151b5e71-65d0-4e68-a6e9-b4207c4113b2' ||
      majorBenefit == '18f6314c-095f-481c-aa76-25a28cb3b2d3' ||
      majorBenefit == '32604af2-1403-4610-8a18-f7c4c2ad295b'
    ) {
      this.formImprove.controls['monetaryBenefit'].enable()
      return true
    }
    return false
  }
  public calcBenefits(hours: string) {
    if (hours != '') {
      const h = parseInt(hours)
      this.formImprove.get("estimatedSaving")?.patchValue(parseFloat((h / FTE).toFixed(2)))

      const cosCenterId = this.departmentDependencies?.costCenterId
      const reductionHours = this.formImprove.get("estimatedHours")?.value
      this.infoFinantialService.getMonetaryBenefit(cosCenterId!, parseInt(reductionHours!))
        .subscribe((costReduction) => {
          console.log(costReduction);
          
          this.formImprove.get("monetaryBenefit")?.patchValue(parseFloat(costReduction.toFixed(2)))
        })
    } else {
      this.clearBenefits()
    }
  }
  public loadDepartmentDependencies() {
    this.departmentService.getDepartment(this.formImprove.value.departmentId!).subscribe((data) => {

      this.departmentDependencies = data
      this.formImprove.get("currentOrganization")?.patchValue(data.currentOrganization.name)
      this.formImprove.get("process")?.patchValue(data.process.name)
      this.formImprove.get("costCenter")?.patchValue(data.costCenter?.code)

    })
  }
  
  public insertImprove() {
    const improve: Improve = { ...this.formImprove.getRawValue()}
    improve.userId = this.userService.userLoged?.userId
    this.improveService.insert(improve).subscribe((data) => console.log(data))
    this.message.MessageSuccess("Improve created with success", true, "improves")
  }
  
  private loadDependencies() {

    forkJoin({
      department: this.departmentService.getDepartments(),
      majorbenefits: this.majorbenefitsService.getMajorBenefits(),
      sourcetypes: this.sourcetypesService.getSourceTypes(),
      ideasource: this.idesourcesService.getIdeaSources()
    }).subscribe(({ department, majorbenefits,sourcetypes, ideasource }) => {

      this.departments = department
      this.majorbenefits = majorbenefits
      this.sourcetypes = sourcetypes
      this.ideasources = ideasource
    })
  }
  public clearBenefits() {
    this.formImprove.get("estimatedHours")?.patchValue(undefined)
    this.formImprove.get("estimatedSaving")?.patchValue(undefined)
    this.formImprove.get("monetaryBenefit")?.patchValue(undefined)
  }

}
