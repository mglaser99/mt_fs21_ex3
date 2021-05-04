#! /bin/bash

scripts=`dirname "$0"`
base=$scripts/..

data=$base/data

mkdir -p $data

tools=$base/tools

# link default training data for easier access

mkdir -p $data/wikitext-2

for corpus in train valid test; do
    absolute_path=$(realpath $tools/pytorch-examples/word_language_model/data/wikitext-2/$corpus.txt)
    ln -snf $absolute_path $data/wikitext-2/$corpus.txt
done

# download a different interesting data set!

# mkdir -p $data/trump
mkdir -p $data/Jokes

# mkdir -p $data/trump/raw
mkdir -p $data/Jokes/raw

#wget https://raw.githubusercontent.com/ryanmcdermott/trump-speeches/master/speeches.txt
mv raw_jokes.txt $data/Jokes/raw

# preprocess slightly

# cat $data/trump/raw/speeches.txt | python $base/scripts/preprocess_raw.py > $data/trump/raw/speeches.cleaned.txt
cat $data/Jokes/raw/raw_jokes.txt | python $base/scripts/preprocess_raw.py > $data/Jokes/raw/jokes_cleaned.txt

# tokenize, fix vocabulary upper bound

# cat $data/trump/raw/speeches.cleaned.txt | python $base/scripts/preprocess.py --vocab-size 5000 --tokenize --lang "en" > \
#    $data/trump/raw/speeches.preprocessed.txt
cat $data/Jokes/raw/jokes_cleaned.txt | python $base/scripts/preprocess.py --vocab-size 5000 --tokenize --lang "en" > \
    $data/Jokes/raw/preprocessed_jokes.txt

# split into train, valid and test

head -n 500 $data/Jokes/raw/preprocessed_jokes.txt > $data/Jokes/valid.txt
head -n 1000 $data/Jokes/raw/preprocessed_jokes.txt | tail -n 500 > $data/Jokes/test.txt
tail -n 9000 $data/Jokes/raw/preprocessed_jokes.txt > $data/Jokes/train.txt
