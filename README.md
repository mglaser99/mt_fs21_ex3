# MT Exercise 3

## 2 Training a recurrent neural network language model

**Dataset**: data/Jokes/raw/raw_jokes
- This is a dataset of 231657 jokes. I only used the first 10000 lines/jokes to train the RNN.
- I preprocessed the 10000 jokes using the commands from download_data.sh.

**Commands**: 
- cat ./data/Jokes/raw/raw_jokes.txt | python ./scripts/preprocess_raw.py > ./data/Jokes/raw/jokes_cleaned.txt
- cat ./data/Jokes/raw/jokes_cleaned.txt | python ./scripts/preprocess.py --vocab-size 5000 --tokenize --lang "en" > ./data/Jokes/raw/preprocessed_jokes.txt
- head -n 500 ./data/Jokes/raw/preprocessed_jokes.txt > ./data/Jokes/valid.txt
- head -n 1000 ./data/Jokes/raw/preprocessed_jokes.txt | tail -n 500 > ./data/Jokes/test.txt
- tail -n 9000 ./data/Jokes/raw/preprocessed_jokes.txt > ./data/Jokes/train.txt

**Training**: I trained 5 models with train.sh with the dropouts 0, 0.3, 0.4, 0.5, 0.7

**Changes**:
- adapted --data path to data/Jokes
- I increased the number of threads to try and increase the run time of the script
- I changed the embedding size and the hidden layers to 250
- For each model i changed the --output to one of the values: 0, 0.3, 0.4, 0.5, 0.7 and saved each model as jokes_model_0, jokes_model_03 etc.

**Generating**: I generated different samples by using and adapting generate.sh

**Changes**:
- --data path to data/Jokes
- changes to --checkpoint to the different models in model/
- changes to --outf for the different outfiles in samples/

## 3 Implement a command line prompt for text generation

Command line prompt example from inside the mt_fs21_ex3 directory:
-  python3 examples/word_language_model/generate.py --data ./data/Jokes --checkpoint ./models/jokes_model_05.pt --outf ./samples/generated_knock3.txt --words 50 --input "Knock knock"

# Pytorch RNN Language Models

This repo shows how to train neural language models using [Pytorch example code](https://github.com/pytorch/examples/tree/master/word_language_model).

# Requirements

- This only works on a Unix-like system, with bash.
- Python 3 must be installed on your system, i.e. the command `python3` must be available
- Make sure virtualenv is installed on your system. To install, e.g.

    `pip install virtualenv`

# Steps

Clone this repository in the desired place:

    git clone https://github.com/lucasseiler/pytorch-rnn-lm
    cd pytorch-rnn-lm

Create a new virtualenv that uses Python 3. Please make sure to run this command outside of any virtual Python environment:

    ./scripts/make_virtualenv.sh

**Important**: Then activate the env by executing the `source` command that is output by the shell script above.

Download and install required software:

    ./scripts/install_packages.sh

Download and preprocess data:

    ./scripts/download_data.sh

Train a model:

    ./scripts/train.sh

The training process can be interrupted at any time, and the best checkpoint will always be saved.

Generate (sample) some text from a trained model with:

    ./scripts/generate.sh
