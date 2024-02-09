import 'package:block_test/screen/bloc/switch/switch_block.dart';
import 'package:block_test/screen/bloc/switch/switch_events.dart';
import 'package:block_test/screen/bloc/switch/switch_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchView extends StatelessWidget {
  const SwitchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Switch"),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Notification"),
              BlocBuilder<SwitchBlock, SwitchStates>(
                  buildWhen: (previous, current) =>
                      previous.isSwitch != current.isSwitch,
                  builder: (context, state) {
                    print("notification");
                    return Switch(
                        value: state.isSwitch,
                        onChanged: (value) {
                          context
                              .read<SwitchBlock>()
                              .add(NotificationEnableDisableEvents());
                          // state.isSwitch = value;
                        });
                  })
            ],
          ),
          const SizedBox(height: 30),
          BlocBuilder<SwitchBlock, SwitchStates>(
            builder: (context, state) {
              return Container(
                height: 200,
                color: Colors.red.withOpacity(state.slider),
              );
            },
          ),
          const SizedBox(height: 20),
          BlocBuilder<SwitchBlock, SwitchStates>(
            buildWhen: (previous, current) => previous.slider != current.slider,
            builder: (context, state) {
              return Slider(
                  value: state.slider,
                  onChanged: (value) {
                    context.read<SwitchBlock>().add(SliderEvent(slider: value));
                  });
            },
          )
        ],
      ),
    );
  }
}
