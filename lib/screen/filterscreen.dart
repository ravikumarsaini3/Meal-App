import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/main.dart';
import 'package:meals_app/screen/drawer.dart';
import 'package:meals_app/screen/tab_screen.dart';


class Filterscreen extends ConsumerStatefulWidget {
  final Map<Filters, bool> currentfilter;
  const Filterscreen({ required this.currentfilter});

  @override
   ConsumerState<Filterscreen> createState() => _FilterscreenState();
}

enum Filters { glutenfree, lactoseFree, vagetarien, vegen }

class _FilterscreenState extends  ConsumerState<Filterscreen> {
  var glutenfreefilterset = false;
  // ignore: non_constant_identifier_names
  var lactosefreefilterset = false;
  var vagetarienfreefilterset = false;
  var vegenfreefilterset = false;

  @override
  void initState() {
  
    glutenfreefilterset =widget.currentfilter[Filters.glutenfree]!;
    lactosefreefilterset =  widget.currentfilter[Filters.lactoseFree]!;
    vagetarienfreefilterset =  widget.currentfilter[Filters.vagetarien]!;
    vegenfreefilterset =  widget.currentfilter[Filters.vegen] !;

    super.initState();
  }

  void selectscreen(String identifier) {
    //Navigator.pop(context);
    if (identifier == 'meals') {
      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return TabScreen();
        },
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Your Filters ',
          style: TextStyle(
              color: Colors.brown, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      drawer: MyDrawer(onselectscreen: selectscreen),
      body: PopScope(
        
        canPop: false,
        onPopInvoked: (bool didPop)async {

          if (didPop) return;
         
          Navigator.of(context).pop({
              Filters.glutenfree: glutenfreefilterset,
            Filters.lactoseFree: lactosefreefilterset,
            Filters.vagetarien: vagetarienfreefilterset,
            Filters.vegen: vegenfreefilterset,
          });
        },
        child: Column(
          children: [
            SwitchListTile(
              value: glutenfreefilterset,
              onChanged: (value) {
                setState(() {
                  glutenfreefilterset = value;
                });
              },
              title: Text(
                'Gluten-Free ',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              subtitle: Text(
                'only  include gluten-free meal',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: theme.colorScheme.onSurface),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: lactosefreefilterset,
              onChanged: (nvalue) {
                lactosefreefilterset = nvalue;
                setState(() {});
              },
              title: Text(
                'lactose-Free ',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              subtitle: Text(
                'only  include  lactose meal',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: theme.colorScheme.onSurface),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: vagetarienfreefilterset,
              onChanged: (value) {
                vagetarienfreefilterset = value;
                setState(() {});
              },
              title: Text(
                'vegatraian ',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              subtitle: Text(
                'only  include vagetarian meal',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: theme.colorScheme.onSurface),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: vegenfreefilterset,
              onChanged: (value) {
                vegenfreefilterset = value;
                setState(() {});
              },
              title: Text(
                'vegen-Free ',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              subtitle: Text(
                'only  include vegen-free meal',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: theme.colorScheme.onSurface),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: EdgeInsets.only(left: 34, right: 22),
            ),
          ],
        ),
      ),
    );
  }
}
