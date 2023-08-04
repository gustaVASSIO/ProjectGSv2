import { Component } from '@angular/core';
import { FormGroup, FormControl, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { UserService } from 'src/app/controllers/user.service';
import User from 'src/app/models/user.model';
import Message from 'src/app/shared/message';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-create-admin',
  templateUrl: './create-admin.component.html',
  styleUrls: ['./create-admin.component.css']
})
export class CreateAdminComponent {
  private message = new Message(this.router)

  passwordFieldControl : string =  'password'
  public formSignUp: FormGroup = new FormGroup({
    userName: new FormControl(undefined, [Validators.required]),
    email: new FormControl(undefined, [Validators.required]),
    password: new FormControl(undefined, [Validators.required, Validators.pattern('^(?=.*[A-Z])(?=.*[-!#@$%&])(?=.*[0-9])(?=.*[a-z]).{8,15}$')]),
    confirmPassword: new FormControl(undefined, [Validators.required, Validators.pattern('^(?=.*[A-Z])(?=.*[-!#@$%&])(?=.*[0-9])(?=.*[a-z]).{8,15}$')])
  })
  
  constructor(
    private userService: UserService,
    private router: Router
  ) { }

  public async confirmRegister() {
    const userRegister: User = { userId: undefined, ...this.formSignUp.value }
    if (userRegister.password == userRegister.confirmPassword) {

      this.userService.registerAdmin(userRegister).subscribe({
        next: (userToken) => {
          this.message.MessageSuccess(`User ${userToken.userName} was created with success`, false)
        },
        error: () => {

          Swal.fire({
            icon: 'error',
            title: 'Duplicated username',
            text: 'This user alredy exist in database'
          })
        },
      })

    } else {
      Swal.fire({
        icon: 'error',
        title: 'Password mismatch'
      })
    }
  }

  public showPassord(){
    this.passwordFieldControl = 'text'
  }
  public hidePassord(){
    this.passwordFieldControl = 'password'
  }
}
