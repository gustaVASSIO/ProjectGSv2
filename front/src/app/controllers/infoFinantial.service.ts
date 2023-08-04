import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { API } from '../shared/API';

@Injectable({
  providedIn: 'root'
})
export class InfoFinantialService {

  constructor(private readonly http : HttpClient) { }
  
  public getMonetaryBenefit(costCenterId : string, reductionHours : number) : Observable<number>{    
    return this.http.get<number>(`${API}/InfoFinantial/MonetaryBenefit/${costCenterId}?reductionalHours=${reductionHours}`)
  }

}
