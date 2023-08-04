import { NgModule } from "@angular/core";
import { RouterModule, Routes } from "@angular/router";
import { CreateImproveComponent } from "../views/pages/create-improve/create-improve.component";
import SignGuard from "../guards/signGuard.guard";
import AuthGuard from "../guards/auth.guard";
import { SingPageComponent } from "../views/pages/sing-page/sing-page.component";
import { ImprovesComponent } from "../views/pages/improves/improves.component";
import { ImprovesPeedingComponent } from "../views/pages/improves-peeding/improves-peeding.component";
import AdminGuard from "../guards/admin.guard";
import { EditImproveComponent } from "../views/pages/edit-improve/edit-improve.component";
import { CreateAdminComponent } from "../views/pages/create-admin/create-admin.component";

const routes : Routes = [
    {path:"sign", component:SingPageComponent, canActivate:[SignGuard]},
    {path:"create", component:CreateImproveComponent, canActivate:[AuthGuard]},
    {path:"create-admin", component:CreateAdminComponent, canActivate:[AuthGuard, AdminGuard]},
    {path:"improves", component:ImprovesComponent, canActivate:[AuthGuard]},
    {path:"improves-peeding", component:ImprovesPeedingComponent, canActivate:[AuthGuard, AdminGuard]},
    {path:"edit-improve/:id", component:EditImproveComponent, canActivate:[AuthGuard, AdminGuard]},
]

@NgModule({
    imports:[RouterModule.forRoot(routes)],
    exports:[RouterModule]
})

export class AppRoutingModule { }