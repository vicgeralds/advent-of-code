#include <stdio.h>
#include <string.h>

#define LINE_SIZE 144

static int read_letters(char *line)
{
    return scanf("%s", line);
}

static int match_word(const char *text, const char *word, int d)
{
    while (*word == *text) {
        word++;
        if (!*word) {
            return 1;
        }
        text += d;
    }

    return 0;
}

static int count_word(const char *text, const char *word)
{
    int count = 0;

    while ((text = strchr(text, word[0]))) {
        count += match_word(text, word, 1) +
            match_word(text, word, LINE_SIZE) +
            match_word(text, word, LINE_SIZE + 1) +
            match_word(text, word, LINE_SIZE - 1);
        text++;
    }

    return count;
}

static int match_m_s(const char *text_a, int d)
{
    if (text_a[d] == 'M')
        return text_a[-d] == 'S';

    return text_a[-d] == 'M' && text_a[d] == 'S';
}

static int count_x_mas(const char *text)
{
    int count = 0;

    text += LINE_SIZE + 1;

    while ((text = strchr(text, 'A'))) {
        count += match_m_s(text, LINE_SIZE + 1) && match_m_s(text, LINE_SIZE - 1);
        text++;
    }

    return count;
}

static int count_xmas(const char *text)
{
    //return count_word(text, "XMAS") + count_word(text, "SAMX");
    return count_x_mas(text);
}

int main()
{
    char lines[5][LINE_SIZE] = {""};
    int count = 0;

    read_letters(lines[0]);
    read_letters(lines[1]);
    read_letters(lines[2]);

    while (read_letters(lines[3]) != EOF) {
        count += count_xmas(lines[0]);
        memmove(lines[0], lines[1], 3 * LINE_SIZE);
    }

    memset(lines[3], '\0', LINE_SIZE);

    count += count_xmas(lines[0]);
    count += count_xmas(lines[1]);
    count += count_xmas(lines[2]);

    printf("%d\n", count);

    return 0;
}
