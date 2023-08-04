
import { Injectable } from "@angular/core";
import { UserService } from "../controllers/user.service";

@Injectable()
export default class AdminGuard{
    constructor(private userService : UserService){}
    
    canActivate() {
        if(this.userService.userLoged?.role=='Admin') return true
        return false
    
    }
    

}