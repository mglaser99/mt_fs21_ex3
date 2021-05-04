# MT Exercise 3

## 2 Training a recurrent neural network language model

For the initial setup of this repository you can follow the original steps for the setup below. I made the necessary changes to the install_packages.sh and download_data.sh files. I added the file raw_jokes.txt to the repository because the original dataset (https://www.kaggle.com/abhinavmoudgil95/short-jokes) was in .csv format and I extracted the data outside the repository.

I trained 5 models with dropout 0, 0.3, 0.4, 0.5, 0.7. The train.sh is set up to train the 0.5 model and save it as models/jokes_model_05.pt. To train and save the other models train.sh needs to be adapted with the respective dropout.

The generate.sh script will generate a text of 50 tokens with the joeks_model_5.pt model.

## 3 Implement a command line prompt for text generation

The examples repo with the adapted generate.py file gets cloned into tools in the install_packages.sh script. Below is an example command line prompt to generate a text with user input:

	python3 ./tools/examples/word_language_model/generate.py --data ./data/Jokes --checkpoint ./models/jokes_model_05.pt --outf ./samples/generated_knock.txt --words 50 --input "Knock knock"


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
