import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import MajorBenefits from '../models/majorbenefits.model';
import { API } from '../shared/API';

@Injectable({
  providedIn: 'root'
})
export class MajorbenefitsService {

  constructor(private readonly http : HttpClient) { }
  public getMajorBenefits() : Observable<Array<MajorBenefits>>{
    return this.http.get<Array<MajorBenefits>>(`${API}/MajorBenefits`)
  }
}
