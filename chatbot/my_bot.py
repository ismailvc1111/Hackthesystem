# Python 3.7
#!pip install chatterbot
#!pip install chatterbot_corpus
#!pip install gtts
#!python3 -m spacy download es
#!pip install spacy==2.3.5
#!python -m spacy download es_core_news_lg

import os
# Chatterbot
from chatterbot import ChatBot
from chatterbot.trainers import ListTrainer, ChatterBotCorpusTrainer
import es_core_news_lg
nlp = es_core_news_lg.load()
# TTS
from gtts import gTTS
from gtts.tokenizer import pre_processors, tokenizer_cases
import gtts.tokenizer.symbols

class my_bot:
    def __init__(self, name='IA'):
        # Nuestro chatBot
        self.chatbot = ChatBot(name, logic_adapters=['chatterbot.logic.MathematicalEvaluation', 'chatterbot.logic.BestMatch'])
        # Text_to_speech
        self.tts_train_symbols()
        self.tok = self.tts_token()
        
    def chatbot_basic_train(self):
        # Entrenamiento básico (compus)
        trainer = ChatterBotCorpusTrainer(self.chatbot)
        trainer.train(
            "chatterbot.corpus.spanish.greetings",
            "chatterbot.corpus.spanish.conversations")
        
    def chatbot_spec_train(self, filename):
        # Entrenamiento específico
        train_list = open(filename, 'r').readlines()
        trainer = ListTrainer(self.chatbot)
        trainer.train(['Hola', '¿Que tal?', 
               'tengo una pregunta', 'si, dime', 
               '¿Como es la estructura del bucle for?', 'Sería con for(i in range(): y lo que quieras dentro del bucle)',
               'Gracias', 'De nada'])
        
    def chatbot_forget(self):
        self.chatbot.storage.drop()
        
    def chatbot_response(self, query):
        response = self.chatbot.get_response(query)
        return response
    
    def tts_train_symbols(self):
        cod_text = [(",", "coma,"), 
                    (".", "punto,"), 
                    (";", "punto y coma,"), 
                    (":", "dos puntos,"), 
                    ("(", "abrimos paréntesis,"),
                    (")", "cerramos paréntesis,")]
        for item in cod_text:
            gtts.tokenizer.symbols.SUB_PAIRS.append(item)
            
    def tts_token(self):
        return gtts.tokenizer.core.Tokenizer([
            tokenizer_cases.tone_marks,
            tokenizer_cases.period_comma,
            tokenizer_cases.other_punctuation])
    
    def chatbot_response_to_mp3(self, query, filename):
        response = self.chatbot_response(query)
        query = pre_processors.word_sub(response.text)
        gtts = gTTS(text=query, lang='es', tokenizer_func=self.tok)
        gtts.save(filename) 

# Ejemplo de uso
# bot = my_bot()
# bot.chatbot_basic_train()
# bot.chatbot_response_to_mp3('Hola, ¿qué tal?', 'test.mp3')