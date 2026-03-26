import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/qoute_event.dart';
import '../bloc/quote_bloc.dart';

import '../bloc/quote_state.dart';

class QuoteScreen extends StatelessWidget {
  const QuoteScreen({super.key});

  @override
  Widget build(BuildContext context) {

    // 👇 THIS LINE FIXES YOUR ISSUE
    context.read<QuoteBloc>().add(GetQuoteEvent());

    return Scaffold(

      appBar: AppBar(
        title: const Text("Quote App",
        style: TextStyle(color: Colors.white,fontSize: 30),),
        backgroundColor: const Color(0xFF0F2027),
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment(-0.5, -0.6),
            radius: 1.2,
            colors: [
              Color(0xFF1B2735),
              Color(0xFF090A0F),
            ],
          ),
        ),
        child: Center(
          child: BlocBuilder<QuoteBloc, QuoteState>(
            builder: (context, state) {
              if (state is QuoteLoading) {
                return const CircularProgressIndicator(
                  color: Colors.white,
                );
              } else if (state is QuoteLoaded) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      state.quote.Content,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "- ${state.quote.Author}",
                      style: const TextStyle(color: Colors.yellowAccent),
                    ),
                  ],
                );
              } else if (state is QuoteError) {
                return Text(
                  state.message,
                  style: const TextStyle(color: Colors.white),
                );
              }
              return const Text(
                "Press button to get quote",
                style: TextStyle(color: Colors.white),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<QuoteBloc>().add(GetQuoteEvent());
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}