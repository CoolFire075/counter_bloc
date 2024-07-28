import 'package:counter_bloc/features/counter/cubit/counter_cubit.dart';
import 'package:counter_bloc/features/counter/cubit/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CounterCubit>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: const Text(
          'Counter',
          style: TextStyle(
              fontSize: 50,
              decoration: TextDecoration.underline,
              letterSpacing: 20),
        ),
        leading: const Icon(Icons.add_alert_outlined, size: 30),
        actions: const [
          Icon(Icons.account_balance_rounded, size: 30),
        ],
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: CounterText(),
          ),
        ],
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: _ButtonsRow(cubit: cubit),
    );
  }
}

class _ButtonsRow extends StatelessWidget {
  const _ButtonsRow({
    required this.cubit,
  });

  final CounterCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FloatingActionButton(
          onPressed: cubit.increment,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.add,
                size: 50,
                color: Colors.green,
              ),
            ],
          ),
        ),
        FloatingActionButton(
          onPressed: cubit.decrement,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.remove,
                size: 50,
                color: Colors.green,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CounterText extends StatelessWidget {
  const CounterText({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterCubit, CounterState>(
      buildWhen: (prev, curr) => prev.counter != curr.counter,
      builder: (BuildContext context, state) => Text(
        '${state.counter}',
        style: const TextStyle(fontSize: 50),
      ),
    );
  }
}
