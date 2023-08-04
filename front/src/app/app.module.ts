import { HttpClientModule } from '@angular/common/http';
import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppComponent } from './views/layout/app/app.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { AppRoutingModule } from './modules/app-routing.module';
import { TopComponent } from './views/layout/top/top.component';
import { CreateImproveComponent } from './views/pages/create-improve/create-improve.component';
import { EditImproveComponent } from './views/pages/edit-improve/edit-improve.component';
import { ReactiveFormsModule } from '@angular/forms';
import { SingPageComponent } from './views/pages/sing-page/sing-page.component';
import { SingupModalComponent } from './views/pages/singup-modal/singup-modal.component';

//Matherial
import { MatInputModule } from '@angular/material/input';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatSelectModule } from '@angular/material/select';
import {MatTableModule} from '@angular/material/table';
import {MatStepperModule} from '@angular/material/stepper';
import { MatDatepickerModule } from '@angular/material/datepicker';
import { MatNativeDateModule } from '@angular/material/core';
import { MatDialogModule } from '@angular/material/dialog'

//NGX BOOTSTRAP
import { BsDropdownModule } from 'ngx-bootstrap/dropdown';

import { UserService } from './controllers/user.service';
import AdminGuard from './guards/admin.guard';
import AuthGuard from './guards/auth.guard';
import SignGuard from './guards/signGuard.guard';
import { ImprovesComponent } from './views/pages/improves/improves.component';
import { ImprovesPeedingComponent } from './views/pages/improves-peeding/improves-peeding.component';
import { InterceptorModule } from './interceptors/interceptor.module';
import { CreateAdminComponent } from './views/pages/create-admin/create-admin.component';


@NgModule({
  declarations: [
    AppComponent,
    TopComponent,
    CreateImproveComponent,
    EditImproveComponent,
    SingPageComponent,
    SingupModalComponent,
    ImprovesComponent,
    ImprovesPeedingComponent,
    CreateAdminComponent
  ],
  imports: [
    BrowserModule,
    BrowserAnimationsModule,
    AppRoutingModule,
    ReactiveFormsModule,
    HttpClientModule,
    MatFormFieldModule,
    MatInputModule,
    MatSelectModule,
    MatTableModule,
    MatStepperModule,
    MatDatepickerModule,
    MatNativeDateModule,
    MatDialogModule,
    InterceptorModule

  ],
  providers: [UserService, AuthGuard, AdminGuard, SignGuard],
  bootstrap: [AppComponent]
})
export class AppModule { }
