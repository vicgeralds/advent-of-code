const decoder = new TextDecoder("utf-8");
const data = await Deno.readFile("day09-input.txt");
const diskMap = decoder.decode(data);
//const diskMap = "2333133121414131402";

type FileBlock = number;
type FreeSpaceBlock = '';
type Block = FileBlock | FreeSpaceBlock;

const compactedBlocks = moveFileBlocks(readDiskMap(diskMap));

const checksum = compactedBlocks
    .map((block, pos) => (block || 0) * pos)
    .reduce((a, b) => a + b);

console.log(checksum);

function readDiskMap(digits: string) {
    const blocks: Block[] = [];

    let isFile = true;
    let fileId = 0;

    for (const digit of digits) {
        const len = +digit;
        const value: Block = isFile ? fileId : '';

        blocks.push(...new Array(len).fill(value));

        if (isFile) {
            fileId++;
        }
        isFile = !isFile;
    }

    return blocks;
}

function moveFileBlocks(blocks: Block[]) {
    while (blocks.includes('')) {
        const index = blocks.indexOf('');
        const lastBlock = blocks.pop()!;
        if (index === blocks.length) {
            break;
        }
        blocks[index] = lastBlock;
    }

    return blocks;
}
