const decoder = new TextDecoder("utf-8");
const data = await Deno.readFile("day09-input.txt");
const diskMap = decoder.decode(data);
//const diskMap = "2333133121414131402";

type FileBlock = number;
type FreeSpaceBlock = '';
type Block = FileBlock | FreeSpaceBlock;

const compactedBlocks = moveFileBlocks(readDiskMap(diskMap));

const checksum = (blocks: Block[]) => blocks
    .map((block, pos) => (block || 0) * pos)
    .reduce((a, b) => a + b);

console.log(checksum(compactedBlocks));

console.log("Part 2");
console.log(checksum(moveWholeFiles(readDiskMap(diskMap))));

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

function moveWholeFiles(blocks: Block[]) {
    const blocksToMove = blocks.slice();

    while (blocksToMove.includes('')) {
        const lastFilePos = findLastFile(blocksToMove);
        if (lastFilePos === -1) {
            break;
        }

        const len = getFileLength(blocksToMove, lastFilePos);
        const removed = blocksToMove.splice(lastFilePos);

        const freePos = findFreeSpace(blocks, len);

        if (freePos === -1 || freePos >= lastFilePos) {
            continue;
        }

        blocks.splice(freePos, len, ...removed.slice(0, len));
        blocks.splice(lastFilePos, len, ...new Array(len).fill(''));
    }

    return blocks;
}

function findLastFile(blocks: Block[]) {
    return blocks.findLastIndex(
        (block, index) => block !== '' && index > 0 && block !== blocks[index - 1]
    )
}

function getFileLength(blocks: Block[], pos: number) {
    let len = 1;

    while (blocks[pos] === blocks[pos + 1]) {
        pos++;
        len++;
    }

    return len;
}

function findFreeSpace(blocks: Block[], len: number) {
    let pos = 0;

    while ((pos = blocks.indexOf('', pos)) !== -1) {
        let count = 1;
        while (count < len && blocks[pos + count] === '') {
            count++;
        }
        if (count === len) {
            return pos;
        }
        pos++;
    }

    return -1;
}
