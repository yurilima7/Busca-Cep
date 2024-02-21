import 'package:busca_cep/app/core/ui/state_controller/state_controller.dart';
import 'package:busca_cep/app/core/ui/styles/text_app.dart';
import 'package:busca_cep/app/core/ui/widgets/full_result_card.dart';
import 'package:busca_cep/app/screens/home/home_screen_controller.dart';
import 'package:busca_cep/app/screens/home/widgets/address_search.dart';
import 'package:busca_cep/app/screens/home/widgets/cep_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

class HomeScreen extends StatefulWidget {
  final bool isCepSearch;

  const HomeScreen({super.key, required this.isCepSearch});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends StateController<HomeScreen, HomeScreenController> {
  final reactionDisposer = <ReactionDisposer>[];
  
  @override
  void onReady() {
    controller.loadMsg();

    final reactionError = reaction<bool>((_) => controller.hasError, (hasError) { 
      if (hasError) {
        showError(controller.error ?? 'Erro!');
        !widget.isCepSearch ? hideLoader() : null;
      }
    });
    
    final reactionAlert = reaction<bool>((_) => controller.hasAlert, (hasAlert) { 
      if (hasAlert) {
        showAlert(controller.alert ?? 'Alerta!');
        !widget.isCepSearch ? hideLoader() : null;
      }
    });

    final reactionSuccess = reaction<bool>((_) => controller.hasSuccess, (hasSucess) { 
      if (hasSucess) {
        showSuccess(controller.success ?? 'Sucesso!');

        if (!widget.isCepSearch) {
          hideLoader();

          Navigator.of(context).pushNamed(
            '/all_address_screen',
            arguments: {'allAddress': controller.allAddress},
          );
        }
      }
    });

    final reactionIsLoading = reaction<bool>((_) => controller.isLoading, (isLoading) { 
      if (isLoading) {
        showLoader();
      } else if(!isLoading && widget.isCepSearch) {
        hideLoader();
      }
    });

    reactionDisposer.add(reactionError);
    reactionDisposer.add(reactionSuccess);
    reactionDisposer.add(reactionAlert);
    reactionDisposer.add(reactionIsLoading);
    super.onReady();
  }

  @override
  void dispose() {
    super.dispose();
    for (var disposer in reactionDisposer) {
      disposer;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Observer(
              builder: (_) => Text(
                controller.msg,
                style: context.textApp.mainRegular,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              'Seja bem-vindo ao Busca CEP',
              style: context.textApp.title,
            ),
          ],
        ),

        toolbarHeight: 100,
        automaticallyImplyLeading: false,
        
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
      
        child: LayoutBuilder(
          builder: (_, constraints) => SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
            
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    Center(
                      child: Image.asset(
                        'assets/images/home_img.png',
                        width: 255, 
                        height: 247.88,
                      ),
                    ),
                    
                    const Spacer(),
                    const SizedBox(height: 20),
      
                    Visibility(
                      visible: widget.isCepSearch,
                      
                      child: Observer(
                        builder: (_) => Visibility(
                          visible: !controller.hasSuccess,
                        
                          replacement: FullResultCard(addressModel: controller.address),
                        
                          child: Text(
                            'Digite seu cep abaixo para receber as informações sobre o endereço.',
                            style: context.textApp.title,
                          ),
                        ),
                      ),
                    ),
            
                    const SizedBox(height: 20),
                    const Spacer(),
            
                    Visibility(
                      visible: widget.isCepSearch,
      
                      replacement: AddressSearch(homeScreenController: controller),
      
                      child: CepSearch(homeScreenController: controller),
                    ),

                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
