import CostCenter from "./costcenter.model";
import CurrentOrganization from "./currentorganization.model";
import Process from "./process.model";

export default interface Department {
    departmentId: string,
    name: string,
    costCenterId?: string,
    costCenter?: CostCenter,
    currentOrganizationId : number ,
    currentOrganization : CurrentOrganization,
    processId : string,
    process : Process,
}