import Department from "./department.model";
import IdeaSource from "./ideasource.model";
import MajorBenefits from "./majorbenefits.model";
import SourceType from "./sourcetype.model";
import UserImprove from "./userImprove.model";

export default interface Improve {
    improvementId?: string,
    assignee?: string,
    departmentId?: string,
    department?: Department,
    summary?: string,
    description?: string,
    majorBenefitsId?: string,
    majorBenefits?: MajorBenefits,
    dueDate?: Date,
    affectEntities?: string,
    estimatedHours?: number,
    estimatedSaving?: number,
    monetaryBenefit?: number,
    sourceTypeId?: string,
    ourceType?: SourceType,
    ideaSourceId?: string,
    deaSource?: IdeaSource,
    components?: string,
    region?: string,
    cipPex?: string,
    currency?: string,
    priority?: string,
    statusImprovement?: boolean
    userId ?: string
    user ?: UserImprove
}