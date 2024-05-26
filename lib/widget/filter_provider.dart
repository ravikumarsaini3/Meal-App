import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Filters { glutenfree, lactoseFree, vagetarien, vegen }

class FilterProvider extends StateNotifier<Map<Filters,bool>>{
  FilterProvider():super({
    Filters.glutenfree:false,
    Filters.lactoseFree:false,
    Filters.vagetarien:false,
    Filters.vegen:false
  });

   void setFfilters(Map<Filters,bool>choosenfilter){
    state=choosenfilter;
  }
  void setfilter(Filters filters,bool isactive){
   // state[filters]=isactive;
    state={
      ...state,
      filters:isactive,
    };

  }
 

}

final providerfilter=StateNotifierProvider<FilterProvider,Map<Filters,bool>>((ref) {
  return FilterProvider();
},);