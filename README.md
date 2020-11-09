This is a Docker wrapper on top of the [themsaid/ibis](https://github.com/themsaid/ibis).

Here's how you can generate your ebook:

```bash
docker run -v $PWD:/app --rm -it tonysm/ibis
```

If you're running on Linux, make sure you specify the user ID, otherwise you might generate the PDF as the root user:

```bash
docker run --user 1000 -v $PWD:/app --rm -it tonysm/ibis
```

You can specify other commands too. The `ibis` PHP phar file is the entrypoint, so you can pass any other valid ibis command to the container, such as:

```bash
docker run --user 1000 -v $PWD:/app --rm -it tonysm/ibis init
```

To generate the scaffolding and sample content.
