import { Injectable } from "@angular/core";
import { UserService } from "../controllers/user.service";


@Injectable()
export default class AuthGuard{
    constructor(private userService : UserService){}
    
    canActivate() {
        if(this.userService.VerifyUserLoged()) return true
        return false
    
    }
    

}