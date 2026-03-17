import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";

export default function HomePage() {
  return (
    <main className="flex min-h-screen flex-col items-center justify-center p-8 gap-8">
      <div className="text-center space-y-4">
        <Badge variant="secondary">Beta</Badge>
        <h1 className="text-4xl font-bold tracking-tight">DyslexicViewer</h1>
        <p className="text-muted-foreground text-lg max-w-xl">
          Point your camera at any text to experience how it might appear to
          someone with dyslexia. Choose a level to simulate different types of
          reading difficulties.
        </p>
      </div>

      <Card className="w-full max-w-md">
        <CardHeader>
          <CardTitle>Get Started</CardTitle>
        </CardHeader>
        <CardContent className="flex flex-col gap-3">
          <Button className="w-full">Open Camera View</Button>
          <Button variant="outline" className="w-full">
            Select Dyslexia Level
          </Button>
        </CardContent>
      </Card>
    </main>
  );
}
